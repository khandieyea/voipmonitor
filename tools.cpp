#include <sys/types.h>
#include <sys/stat.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <poll.h>
#include <unistd.h>
#include <string>
#include <fcntl.h>
#include <errno.h>
#include <syslog.h>
#include <netdb.h>
#include <resolv.h>
#include <sys/time.h>
#include <string.h>
#include <net/ethernet.h>
#include <netinet/ip.h>
#include <netinet/tcp.h>
#include <net/if.h>
#include <syslog.h>
#include <sys/ioctl.h> 


#include <iostream>


#include "tools.h"

extern char mac[32];

int getUpdDifTime(struct timeval *before)
{
	int dif = getDifTime(before);

	gettimeofday(before,0);

	return dif;
}

int getDifTime(struct timeval *before)
{
	struct timeval now;
	gettimeofday(&now,0);

	return (((int)now.tv_sec)*1000000+now.tv_usec) - (((int)before->tv_sec)*1000000+before->tv_usec);
}

int msleep(long msec)
{
	struct timeval tv;

	tv.tv_sec=(int)((float)msec/1000000);
	tv.tv_usec=msec-tv.tv_sec*1000000;
	return select(0,0,0,0,&tv);
}

int file_exists (char * fileName)
{
	struct stat buf;
	/* File found */
	if (stat(fileName, &buf) == 0) {
		return buf.st_size;
	}
	return 0;
}

void
set_mac() {   
	int s, res;
	struct ifreq buffer;

	s = socket(PF_INET, SOCK_DGRAM, 0);
	if(s == -1) {
		printf("Opening socket failed\n");
		return;
	}
	memset(&buffer, 0x00, sizeof(buffer));
	strcpy(buffer.ifr_name, "eth0");
	res = ioctl(s, SIOCGIFHWADDR, &buffer);
	close(s);

	sprintf(mac, "%02x:%02x:%02x:%02x:%02x:%02x",
		0xff & buffer.ifr_hwaddr.sa_data[0],
		0xff & buffer.ifr_hwaddr.sa_data[1],
		0xff & buffer.ifr_hwaddr.sa_data[2],
		0xff & buffer.ifr_hwaddr.sa_data[3],
		0xff & buffer.ifr_hwaddr.sa_data[4],
		0xff & buffer.ifr_hwaddr.sa_data[5]);
}

/*
int mkdir_r(const char* file_path, mode_t mode) {
	if(!file_path) return 0;

	char buf[1024];
	strncpy(buf, file_path, 1023);
	char *p = buf;
	for (p = buf; p; p = strchr(p + 1, '/')) {
		*p = '\0';
		mkdir(file_path, mode);
		*p = '/';
	}
	return 0;
}
*/

int
mkdir_r(std::string s, mode_t mode)
{
	size_t pre = 0, pos;
	std::string dir;
	int mdret = 0;

	if(s[s.size() - 1 ] != '/'){
		// force trailing / so we can handle everything in loop
		s += '/';
	}

	while((pos = s.find_first_of('/', pre)) != std::string::npos) {
		dir = s.substr(0, pos++);
		pre = pos;
		if(dir.size() == 0) continue; // if leading / first time is 0 length
		if((mdret = mkdir(dir.c_str(), mode)) && errno != EEXIST){
			return mdret;
		}
	}
	return mdret;
}

