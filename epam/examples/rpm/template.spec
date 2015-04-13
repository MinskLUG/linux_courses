Name: template
Version: 0.2
Release: epam1

Packager: Denis Pynkin <denis_pynkin@epam.com>
Url: http://epam.com

Summary: Template for programm %name
License: GPL
Group: Other

#Source: %name-%version.tar.bz2
#Patch: %name-%version.patch

Requires: bash
Requires: %name-base >= 0.1

BuildRequires: gcc

%package base
Summary: Template for programm %name-base
License: GPL
Group: Other
BuildArch: noarch

%description
This is a template for Linux courses

%description base
This is a template for Linux courses.
Base part.

%pre
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo %name-%version: pre-install

%post
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo %name-%version: post-install

%preun
MODE=$1
case $MODE in
    0 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    1 ) # Erase-only
	echo -n "Erase mode: "
        ;; # End of erase-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo %name-%version: pre-uninstall

%postun
MODE=$1
case $MODE in
    0 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    1 ) # Erase-only
	echo -n "Erase mode: "
        ;; # End of erase-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo %name-%version: post-uninstall

# for base package
%pre base
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo %name-base-%version: pre-install

%post base
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo %name-base-%version: post-install

%preun base
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo %name-base-%version: pre-uninstall

%postun base
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo %name-base-%version: post-uninstall

# Show triggers work
%triggerin -- %name-base
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo Trigger: %name-%version: triggerin

%triggerun -- %name-base
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo Trigger: %name-%version: triggerpreun

%triggerpostun -- %name-base
MODE=$1
case $MODE in
    1 ) # Install-only
	echo -n "Installing mode: "
        ;; # End of install-only section
    2 ) # Upgrade-only
	echo -n "Upgrade mode: "
        ;; # End of upgrade-only section
    * )
	echo -n "Unknown mode: "
        ;;
esac
echo Trigger: %name-%version: triggerpostun

# Setup -- unpack sources here
%prep
# %setup
# %patch -p1
pwd
cat <<E_O_F > hw.c
#include<stdio.h>

int main(void) {
	printf("Hello World\n");
	return 0;
}
E_O_F

# Build
%build
pwd
%__cc %optflags -o hw hw.c

# Install
%install
mkdir -p %{buildroot}%{_bindir}
%__install -m 0666 hw %{buildroot}%{_bindir}
ls -l %{buildroot}%{_bindir}/

# Cleanup if needed
%clean


%files
%defattr(0755,root,root,-)
%{_bindir}/*

%files base

%changelog
* Mon Apr 13 2015 Denis Pynkin <dans@altlinux.org> 0.2-epam1
- Added hello world compilation

* Wed Mar 20 2013 Denis Pynkin <dans@altlinux.org> 0.1-epam1.1
- Template created

