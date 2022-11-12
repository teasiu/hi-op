--teasiu<teasiu@qq.com>
module("luci.controller.admconf", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/admconf") then
		return
	end
	
	entry({"admin", "system", "admconf"}, cbi("admconf"), _("高级配置"), 88)
end
