# $Id: env_jpcap,v 1.13 2004/07/21 20:23:53 pcharles Exp $
#
# This script sets up required paths for jpcap development.
#
# NOTE: 
#   You must have a JDK (v1.2 or later) installed before running this script.
#   A Java compiler should be in your path. The build process relies on 
#   the environment variable JAVA_HOME in order to locate native headers.
#
#   If these aren't already in your shell environment, execute something like:
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64; export PATH=$JAVA_HOME/bin:$PATH
#
#   Futher customize this script by changing PROJECT_HOME and RELEASE_HOME.
#

# change to the location in your workspace where jpcap is checked out..
#export PROJECT_HOME=~/dev/sourceforge/jpcap
export PROJECT_HOME=/home/zxj/project/IdeaProjects/jpcap-0.01.16/

# NOTE: Windows users, with MinGW, '~/' doesn't work in CLASSPATH. Instead:
#export PROJECT_HOME=/home/$USERNAME/dev/sourceforge/jpcap

# change to point to the location where built distributions will be placed..
#export RELEASE_HOME=~/dev/releases
export RELEASE_HOME=/home/zxj/project/IdeaProjects/jpcap-0.01.16/releases

# NOTE: Windows users must specify path to WinPcap.
#export WINPCAP_HOME=/c/WpdPack

# cvs
## secure checkout; read/write privileges for registered jpcap developers
export CVS_RSH=/usr/bin/ssh
export CVSROOT=:ext:$USER@cvs.sourceforge.net:/cvsroot/jpcap
## anonymous checkout; read-only privileges for jpcap 'client' developers
#export CVSROOT=:pserver:anonymous@cvs.sourceforge.net:/cvsroot/jpcap

# classpath
export CLASSPATH=$CLASSPATH:$PROJECT_HOME/src/java

# required 3rd-party classes from fooware and ultrametrics
JARS=$PROJECT_HOME/thirdParty/jars
export CLASSPATH=$CLASSPATH:$JARS/fooware_CommandLine-1.0.jar
export CLASSPATH=$CLASSPATH:$JARS/dev-classes_net.ultrametrics-0.03.jar
export CLASSPATH=$CLASSPATH:$JARS/junit.jar

# makefiles
export MAKE_HOME=$PROJECT_HOME/make

# libraries
PROJECT_LIBS=$PROJECT_HOME/src/java/net/sourceforge/jpcap/capture
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PROJECT_LIBS
if [ `uname` = "Darwin" ]; then
	export DYLD_LIBRARY_PATH=DYLD_LIBRARY_PATH:$PROJECT_LIBS
fi

# in Red Hat 8.0, something changed in either bash or gmake which is causing
# gmake to no longer pick up the OSTYPE variable w/o an explicit export
export OSTYPE
export HOSTTYPE

# cwd to directory for work on java components by default..
cd $PROJECT_HOME/src/java/net/sourceforge/jpcap
