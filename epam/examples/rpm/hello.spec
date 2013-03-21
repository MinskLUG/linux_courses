Name:           hello
Summary:        Hello world package
Version:        0.1
Release:        1
License:        BSD
Group:          System Environment/Base
URL:            http://github.com/git/hello-world.git

Source:         %name-%{version}.tar

BuildRequires: gcc

%description
%name example

%prep
%setup

%build
%__cc c.c -o helloworld

%install
mkdir -p %{buildroot}%{_bindir}
pwd
ls -l
cp -f helloworld %{buildroot}%{_bindir}/helloworld

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root,-)
%{_bindir}/*

%changelog
* Wed Mar 20 2013 Denis Pynkin <dans@altlinux.org> 0.1-1
- Initial spec
