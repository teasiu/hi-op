--teasiu<teasiu@163.com>
local fs = require "nixio.fs"
local sys = require "luci.sys"
m = Map("admconf", translate("openwrt高级设置"), translate("各类服务内置脚本文档的直接编辑,除非你知道自己在干什么,否则请不要轻易修改这些配置文档"))
s = m:section(TypedSection, "admconf")
s.anonymous=true
--
--
--
s:tab("config", translate("固件版本"),translate("修改成你喜欢看到的名字"))
conf = s:taboption("config", Value, "editconf", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/openwrt_release") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/openwrt_release", value)
		if (luci.sys.call("cmp -s /tmp/openwrt_release /etc/openwrt_release") == 1) then
			fs.writefile("/etc/openwrt_release", value)
		end
		fs.remove("/tmp/openwrt_release")
	end
end
--
--
--
if nixio.fs.access("/etc/exports") then
if sys.call("pidof nfsd >/dev/null") == 0 then
s:tab("config2", translate("配置NFSD"),translate("<b><font color=\"green\">nfs服务端运行中</font></b>,本页是配置/etc/exports的文档内容。<a href=\"http://www.right.com.cn/forum/thread-182695-1-1.html\" target=\"_blank\">  教程1>></a>,<a href=\"https://wiki.openwrt.org/doc/howto/nfs.server\" target=\"_blank\">  教程2>></a>"))
else
s:tab("config2", translate("配置NFSD"),translate("<b><font color=\"red\">nfs服务端尚未运行</font></b>,本页是配置/etc/exports的文档内容。<a href=\"http://www.right.com.cn/forum/thread-182695-1-1.html\" target=\"_blank\">  教程1>></a>,<a href=\"https://wiki.openwrt.org/doc/howto/nfs.server\" target=\"_blank\">  教程2>></a>"))
end
conf = s:taboption("config2", Value, "editconf2", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/exports") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/exports", value)
		if (luci.sys.call("cmp -s /tmp/exports /etc/exports") == 1) then
			fs.writefile("/etc/exports", value)
			luci.sys.call("exportfs -r >/dev/null")
		end
		fs.remove("/tmp/exports")
	end
end
end
--
--
--
if nixio.fs.access("/etc/config/vsftpd") then
if sys.call("pidof vsftpd >/dev/null") == 0 then
s:tab("config3", translate("配置FTP"),translate("<b><font color=\"green\">FTP服务器运行中</font></b>，本页是配置/etc/config/vsftpd的文档内容"))
else
s:tab("config3", translate("配置FTP"),translate("<b><font color=\"red\">FTP服务器未运行</font></b>，本页是配置/etc/config/vsftpd的文档内容"))
end
conf = s:taboption("config3", Value, "editconf3", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/config/vsftpd") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/vsftpd", value)
		if (luci.sys.call("cmp -s /tmp/vsftpd /etc/config/vsftpd") == 1) then
			fs.writefile("/etc/config/vsftpd", value)
			luci.sys.call("/etc/init.d/vsftpd restart >/dev/null")
		end
		fs.remove("/tmp/vsftpd")
	end
end
end
--
--
--
if nixio.fs.access("/etc/dnsmasq.conf") then
s:tab("config4", translate("配置dnsmasq"),translate("本页是配置/etc/dnsmasq.conf的文档内容。"))
conf = s:taboption("config4", Value, "editconf4", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/dnsmasq.conf") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/dnsmasq.conf", value)
		if (luci.sys.call("cmp -s /tmp/dnsmasq.conf /etc/dnsmasq.conf") == 1) then
			fs.writefile("/etc/dnsmasq.conf", value)
			luci.sys.call("/etc/init.d/dnsmasq restart >/dev/null")
		end
		fs.remove("/tmp/dnsmasq.conf")
	end
end
end
--
--
--
if nixio.fs.access("/etc/wifidog.conf") then
s:tab("config5", translate("配置wifidog"),translate("本页是配置/etc/wifidog.conf的文档内容。"))
conf = s:taboption("config5", Value, "editconf5", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/wifidog.conf") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/wifidog.conf", value)
		if (luci.sys.call("cmp -s /tmp/wifidog.conf /etc/wifidog.conf") == 1) then
			fs.writefile("/etc/wifidog.conf", value)
		end
		fs.remove("/tmp/wifidog.conf")
	end
end
end
--
--
--
if nixio.fs.access("/etc/config/network") then
s:tab("config6", translate("配置network"),translate("本页是配置/etc/config/network的文档内容。<a href=\"https://wiki.openwrt.org/doc/howto/start\" target=\"_blank\">  教程>></a>"))
conf = s:taboption("config6", Value, "editconf6", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/config/network") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/adnetwok", value)
		if (luci.sys.call("cmp -s /tmp/adnetwork /etc/config/network") == 1) then
			fs.writefile("/etc/config/network", value)
			luci.sys.call("/etc/init.d/network restart >/dev/null")
		end
		fs.remove("/tmp/adnetwork")
	end
end
end
--
--
--
if nixio.fs.access("/etc/phlinux.conf") then
if sys.call("pidof phddns >/dev/null") == 0 then
s:tab("config7", translate("配置花生壳"),translate("检测到<b><font color=\"green\">花生壳服务已经运行中</font></b>，本页是配置/etc/phlinux.conf的文档内容。<a href=\"http://service.oray.com/question/116.html\" target=\"_blank\">  教程>></a>"))
else
s:tab("config7", translate("配置花生壳"),translate("检测到<b><font color=\"red\">花生壳服务尚未运行</font></b>，本页是配置/etc/phlinux.conf的文档内容。<a href=\"http://service.oray.com/question/116.html\" target=\"_blank\">  教程>></a>"))
end
conf = s:taboption("config7", Value, "editconf7", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 10
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/phlinux.conf") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/phlinux.conf", value)
		if (luci.sys.call("cmp -s /tmp/phlinux.conf /etc/phlinux.conf") == 1) then
			fs.writefile("/etc/phlinux.conf", value)
			luci.sys.call("/usr/bin/phddns -c /etc/phlinux.conf -d >/dev/null")
		end
		fs.remove("/tmp/phlinux.conf")
	end
end
end
--
if nixio.fs.access("/etc/vpnc/default.conf") then
if sys.call("pidof vpnc >/dev/null") == 0 then
s:tab("config8", translate("配置VPNC"),translate("<b><font color=\"green\">vpnc服务器运行中</font></b>，本页是配置/etc/vpnc/default.conf的文档内容"))
else
s:tab("config8", translate("配置VPNC"),translate("<b><font color=\"red\">vpnc服务器未运行</font></b>，本页是配置/etc/vpnc/default.conf的文档内容"))
end
conf = s:taboption("config8", Value, "editconf8", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/vpnc/default.conf") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/vpncdef.conf", value)
		if (luci.sys.call("cmp -s /tmp/vpncdef.conf /etc/vpnc/default.conf") == 1) then
			fs.writefile("/etc/vpnc/default.conf", value)
			luci.sys.call("vpnc /etc/vpnc/default.conf >/dev/null")
		end
		fs.remove("/tmp/vpncdef.conf")
	end
end
end
--
--
if nixio.fs.access("/etc/config/system") then
s:tab("config9", translate("配置system"),translate("本页是配置/etc/config/system的文档内容。这将改变系统基本配置，谨慎！<a href=\"https://wiki.openwrt.org/doc/howto/start\" target=\"_blank\">  教程>></a>"))
conf = s:taboption("config9", Value, "editconf9", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/config/system") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/adsystem", value)
		if (luci.sys.call("cmp -s /tmp/adsystem /etc/config/system") == 1) then
			fs.writefile("/etc/config/system", value)
		end
		fs.remove("/tmp/adsystem")
	end
end
end
--
if nixio.fs.access("/etc/hosts") then
s:tab("config10", translate("配置hosts"),translate("本页是配置/etc/hosts的文档内容。"))
conf = s:taboption("config10", Value, "editconf10", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/hosts") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/adhosts", value)
		if (luci.sys.call("cmp -s /tmp/adhosts /etc/hosts") == 1) then
			fs.writefile("/etc/hosts", value)
		end
		fs.remove("/tmp/adhosts")
	end
end
end
--
if nixio.fs.access("/etc/config/wireless") then
s:tab("config11", translate("配置wireless"),translate("本页是配置/etc/config/wireless的文档内容。"))
conf = s:taboption("config11", Value, "editconf11", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/config/wireless") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/adwireless", value)
		if (luci.sys.call("cmp -s /tmp/adwireless /etc/config/wireless") == 1) then
			fs.writefile("/etc/config/wireless", value)
			luci.sys.call("/etc/init.d/network restart >/dev/null")
		end
		fs.remove("/tmp/adwireless")
	end
end
end
--
if nixio.fs.access("/etc/ssmtp/ssmtp.conf") then
s:tab("config12", translate("配置发邮件"),translate("本页是配置/etc/ssmtp/ssmtp.conf的文档内容。请另行百度或编写脚本自动定时发送。"))
conf = s:taboption("config12", Value, "editconf12", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/ssmtp/ssmtp.conf") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/adssmtp.conf", value)
		if (luci.sys.call("cmp -s /tmp/adssmtp.conf /etc/ssmtp/ssmtp.conf") == 1) then
			fs.writefile("/etc/ssmtp/ssmtp.conf", value)
			end
		fs.remove("/tmp/adwireless")
	end
end
end
--
if nixio.fs.access("/etc/config/dhcp") then
s:tab("config13", translate("配置DHCP"),translate("本页是配置/etc/config/dhcp的文档内容。"))
conf = s:taboption("config13", Value, "editconf13", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/config/dhcp") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/dhcp", value)
		if (luci.sys.call("cmp -s /tmp/dhcp /etc/config/dhcp") == 1) then
			fs.writefile("/etc/config/dhcp", value)
			luci.sys.call("/etc/init.d/dnsmasq restart >/dev/null")
		end
		fs.remove("/tmp/dhcp")
	end
end
end
--
if nixio.fs.access("/etc/vsftpd.conf") then
if sys.call("pidof vsftpd >/dev/null") == 0 then
s:tab("config14", translate("配置FTP"),translate("<b><font color=\"green\">FTP服务器运行中</font></b>，本页是配置/etc/vsftpd.conf的文档内容"))
else
s:tab("config14", translate("配置FTP"),translate("<b><font color=\"red\">FTP服务器未运行</font></b>，本页是配置/etc/vsftpd.conf的文档内容"))
end
conf = s:taboption("config14", Value, "editconf14", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/vsftpd.conf") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/vsftpd.conf", value)
		if (luci.sys.call("cmp -s /tmp/vsftpd.conf /etc/vsftpd.conf") == 1) then
			fs.writefile("/etc/vsftpd.conf", value)
			luci.sys.call("/etc/init.d/vsftpd restart >/dev/null")
		end
		fs.remove("/tmp/vsftpd.conf")
	end
end
end
--
if nixio.fs.access("/etc/settings.sh") then
s:tab("config15", translate("配置settings"),translate("本页是配置/etc/settings.sh的文档内容。"))
conf = s:taboption("config15", Value, "editconf15", nil, translate("开头的数字符号（＃）或分号的每一行（;）被视为注释；删除（;）启用指定选项。"))
conf.template = "cbi/tvalue"
conf.rows = 20
conf.wrap = "off"
function conf.cfgvalue(self, section)
	return fs.readfile("/etc/settings.sh") or ""
end
function conf.write(self, section, value)
	if value then
		value = value:gsub("\r\n?", "\n")
		fs.writefile("/tmp/settings.sh", value)
		if (luci.sys.call("cmp -s /tmp/settings.sh /etc/settings.sh") == 1) then
			fs.writefile("/etc/settings.sh", value)
		end
		fs.remove("/tmp/settings.sh")
	end
end
end
--
return m
