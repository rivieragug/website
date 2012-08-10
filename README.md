Install procedure
=================
Here is a procedure to install all pre-requisites softwares. Links section gives you the URL. Then each section gives you the installion command. We recommand you do the install stuff before the WE.

Links
-----
* Java sun 1.7 update 5
<http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1637583.html>

* GGTS
<http://www.springsource.org/downloads/sts>

click on _OTHER DOWNLOADS >_ and look for GROOVY/GRAILS TOOL SUITE 3.0.0

* Groovy 1.8.6
<http://groovy.codehaus.org/Download>

* Grails 2.1.0
<http://grails.org/Download/>

* Git 
<http://git-scm.com/>

* HTML5 browser + Web developer environment: For example Firefox + Firebug

Linux
-----

_Warning_: this install intructions is only for Ubuntu-debian based distribution

**1. Java sun 1.7 update 5**

*download see link above*

*command*

	cd /usr/lib/jvm
	sudo tar xvzf ~/jdk-7u5-linux-*.tar.gz
	sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_05/bin/java 1
	sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.7.0_05/bin/javac 1
	sudo update-alternatives --install /usr/bin/javaws javaws /usr/lib/jvm/jdk1.7.0_05/bin/javaws 1
	(optional)sudo update-alternatives --install /usr/lib/mozilla/plugins/libjavaplugin.so mozilla-javaplugin.so /usr/lib/jvm/jdk1.7.0_05/jre/lib/i586/libjavaplugin_jni.so 1
	sudo update-alternatives --config java
	sudo update-alternatives --config javac
	sudo update-alternatives --config javaws
	(optional)sudo update-alternatives --config mozilla-javaplugin.so

*verify installation*

	java -version

**2. Groovy 1.8.6**

	sudo add-apt-repository ppa:groovy-dev/groovy
	sudo apt-get update
	sudo apt-get install groovy-1.8

*verify installation*

	groovy --version

*switch between versions*

	sudo update-alternatives --config groovy

**3. Grails 2.1.0**

	sudo add-apt-repository ppa:groovy-dev/grails
	sudo apt-get update
	sudo apt-get install grails 2.1.0

*switch between versions*

	sudo update-alternatives --config grails
	
*correct stupid bug already submitted*
	
	cd /usr/share/grails/2.1.0/bin
	edit the file startGrails
	comment the third line and replace with
	export JAVA_HOME=$(update-alternatives --query java | grep Value | sed 's_^Value: __g' | sed 's/\/bin\/java//g')

*verify installation*

	grails --version

**4. GGTS IDE**

	cd _where_you_want_
	tar -xzf groovy-grails-tool-suite-3.0.0.M3-e4.2-linux-gtk-x86_64.tar.gz

**5. Git**

	sudo apt-get install git

Windows
-------

**1. Java sun 1.7 update 5**

*download see link above*

*extract with winzip where you want*

*add JAVA_HOME to System environment variables*

*add %JAVA_HOME%\bin to your PATH*

*verify installation*

	java -version

**2. Groovy 1.8.6**

*download see link above*

*extract with winzip where you want*

*add GROOVY_HOME to System environment variables*

*add %GROOVY_HOME%\bin to your PATH*

*verify installation*

	groovy --version

**3. Grails 2.1.0**

*download see link above*

*extract with winzip where you want*

*add GRAILS_HOME to System environment variables*

*add %GRAILS_HOME%\bin to your PATH*

*verify installation*

	grails --version

**4. GGTS IDE**

*download see link above*

*extract with winzip where you want*

*create shortcut on your desktop*

**5. Git**

*download*

<http://git-scm.com/download/win>

*run the exe*

MacOS
-----

**1. Java sun 1.7 update 5**

Apple supplies their own version of Java. Use the Software Update feature (available on the Apple menu) to check that you have the most up-to-date version of Java for your Mac. 

*verify installation*

	java -version

**2. Groovy 1.8.6**

*download see link above*

*unpack it into some file on your local file system*

*set your GROOVY_HOME environment variable to the directory you unpacked the distribution*

*add GROOVY_HOME/bin to your PATH environment variable*

*verify installation*

	groovy --version

**3. Grails 2.1.0**

*download see link above*

*unpack it into some file on your local file system*

*set your GRAILS_HOME environment variable to the directory you unpacked the distribution*

*add GRAILS_HOME/bin to your PATH environment variable*

*verify installation*

	grails --version

**4. GGTS IDE**

*Download groovy-grails-tool-suite-3.0.0.M3-e4.2-macosx-cocoa-x86_64-installer.dmg*

**5. Git**

*download*

<http://git-scm.com/download/mac>

*install the dmg*

**6. Alternatively, you can try Homebrew to deal with your install**

*link*

<http://mxcl.github.com/homebrew/>

*command*

	ruby <(curl -fsSk https://raw.github.com/mxcl/homebrew/go)

*** Groovy 1.8.6

As the last availble version of Groovy in homebrew is 2.0.0, here is the little trick to install 1.8.6:

	# cd to your homebrew dir. Usually /usr/local/
	cd /usr/local/ 
	
	# list older versions
	brew versions groovy
	
	# copy/paste the gt command in front of v1.8.6
	git checkout b688a91 Library/Formula/groovy.rb
	
	# proceed install
	brew install groovy

Add `GROOVY_HOME` to your environement (edit your ~/.bash_profile)

	export GROOVY_HOME=/usr/local/Cellar/groovy/1.8.6/libexec

*** Grails 2.1.0

Install latest grails:

	brew install grails

Add `GRAILS_HOME` to your environement (edit your ~/.bash_profile)

	export GRAILS_HOME=/usr/local/Cellar/grails/2.1.0/libexec



FreeBSD
-------
Sorry Pascal but I think you are the only one. So help yourself. It's not mainstream indeed.


GGTS
=====

*Open GGTS*
*Go to Windows->Preferences*
*In filter text type grails*
*Add Grails 2.1.0*

GitHub
======

*create a github account*

<https://github.com>

*give us your github username, so we can add you as a collaborator*

*please clone as usual*

	git clone https://github.com/rivieragug/website.git

Continious Delivery
===================

=> in Config.groovy

	grails.plugin.cloudfoundry.username = 'rivieragugcoding@gmail.com'
	grails.plugin.cloudfoundry.password = 'codingweekend'

=> to push in cloud foundry, in buildConfig.groovy

	mavenRepo "http://maven.springframework.org/milestone/"

See You on Friday
==================

For those who won't have time to do their homework, downloaded version will be available and we can grant github repository access on Friday.
See you on Friday.
