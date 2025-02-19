FROM rockylinux:8

# Build arguments
ARG IN_PIPELINE=false
ARG TOKEN
ARG PACKAGE_NAME

# Enable PowerTools and EPEL
RUN dnf install -y epel-release && \
    dnf install -y dnf-plugins-core && \
    dnf config-manager --set-enabled powertools

# Install base development tools and dependencies
RUN dnf install -y gcc-c++ \
    make \
    cmake \
    git \
    rpm-build \
    rpmdevtools \
    conserver \
    conserver-client

# Configure GitLab repository for dependencies
RUN echo $'\n\
[gitlab-rpm-repo]\n\
name=GitLab RPM Repository\n\
baseurl=https://oauth2:***REMOVED-GITLAB-TOKEN***@gitlab.com/api/v4/projects/66226575/packages/generic/rpm-repo/1.0/\n\
enabled=1\n\
gpgcheck=0\n\
' > /etc/yum.repos.d/gitlab-rpm-repo.repo && \
    dnf makecache --refresh

# Create directory for RPMs
RUN mkdir -p /tmp/rpms/

# Copy RPMs if they exist (in pipeline mode)
COPY rpms/ /tmp/rpms/

# Install local RPM if in pipeline mode, otherwise from repo
RUN if [ "$IN_PIPELINE" = "true" ] ; then \
        if [ "$(ls -A /tmp/rpms/)" ] ; then \
            if ls /tmp/rpms/*-devel*.rpm 1> /dev/null 2>&1; then \
                dnf install -y /tmp/rpms/*-devel*.rpm /tmp/rpms/*.rpm ; \
            else \
                dnf install -y /tmp/rpms/*.rpm ; \
            fi \
        else \
            echo "No RPMs found in /tmp/rpms, falling back to repo install" && \
            if dnf list ${PACKAGE_NAME}-devel &>/dev/null; then \
                dnf install -y ${PACKAGE_NAME}-devel ${PACKAGE_NAME} ; \
            else \
                dnf install -y ${PACKAGE_NAME} ; \
            fi \
        fi \
    else \
        if dnf list ${PACKAGE_NAME}-devel &>/dev/null; then \
            dnf install -y ${PACKAGE_NAME}-devel ${PACKAGE_NAME} ; \
        else \
            dnf install -y ${PACKAGE_NAME} ; \
        fi \
    fi

# Cleanup
RUN dnf clean all && \
    rm -rf /var/cache/dnf /tmp/rpms

# Verify installation
CMD ["sh", "-c", "rpm -qa ${PACKAGE_NAME}"] 