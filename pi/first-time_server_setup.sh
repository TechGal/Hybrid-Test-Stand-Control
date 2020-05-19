# This aims script automates the setup of the Raspberry Pi server. It automagically installs
# python modules, packages, creates necessary folders, etc.

# Download (git clone) all the files from our GitHub 
git clone https://github.com/jjderooy/Hybrid-Test-Stand-Control /home/pi/Documents/htsc

# Make folder (mkdir) for log files generated by running the engine
mkdir /home/pi/Documents/logs

# Install (pip3) python3 module  phidget22 for stepper motor controller boards
pip3 install phidget22

# Change mode (mode) of rc.local so we can modify it. 777 is the permission id we are changing to.
# 777 allows anyone to read an write to the file. 
sudo chmod 777 /etc/rc.local

# Edit (sed) rc.local to automatically start the server when the Pi turns on. /exit 0/i inserts before "exit 0"
	# From the rc.local file on the GitHub that this line replaces:
	# Put this line before the exit statement in /etc/rc.local.
	# The 30 second sleep is to allow the pi's networking to
	# initialize (the 30s is arbitrary but seems to work).
sed  '/exit 0/i (sleep 30s && /home/pi/Documents/htsc/pi/starthtsc.sh) &' /etc/rc.local > /etc/rc.local
