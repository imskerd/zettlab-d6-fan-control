#include <linux/module.h>
#include <linux/export-internal.h>
#include <linux/compiler.h>

MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};



static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0x97dd6ca9, "ioremap" },
	{ 0x528d5f2f, "devm_hwmon_device_register_with_info" },
	{ 0x4695bf9b, "platform_driver_unregister" },
	{ 0x79b86010, "platform_device_unregister" },
	{ 0xbd03ed67, "__ref_stack_chk_guard" },
	{ 0xc961346f, "platform_device_register_full" },
	{ 0x223cc85c, "__platform_driver_register" },
	{ 0xd272d446, "__stack_chk_fail" },
	{ 0x7e2232fb, "ioread8" },
	{ 0xd272d446, "__fentry__" },
	{ 0xd272d446, "__x86_return_thunk" },
	{ 0xf46d5bf3, "mutex_lock" },
	{ 0xf46d5bf3, "mutex_unlock" },
	{ 0x01da6614, "iowrite8" },
	{ 0x79fd4f39, "devm_kmalloc" },
	{ 0xc1e6c71e, "__mutex_init" },
	{ 0xbebe66ff, "module_layout" },
};

static const u32 ____version_ext_crcs[]
__used __section("__version_ext_crcs") = {
	0x97dd6ca9,
	0x528d5f2f,
	0x4695bf9b,
	0x79b86010,
	0xbd03ed67,
	0xc961346f,
	0x223cc85c,
	0xd272d446,
	0x7e2232fb,
	0xd272d446,
	0xd272d446,
	0xf46d5bf3,
	0xf46d5bf3,
	0x01da6614,
	0x79fd4f39,
	0xc1e6c71e,
	0xbebe66ff,
};
static const char ____version_ext_names[]
__used __section("__version_ext_names") =
	"ioremap\0"
	"devm_hwmon_device_register_with_info\0"
	"platform_driver_unregister\0"
	"platform_device_unregister\0"
	"__ref_stack_chk_guard\0"
	"platform_device_register_full\0"
	"__platform_driver_register\0"
	"__stack_chk_fail\0"
	"ioread8\0"
	"__fentry__\0"
	"__x86_return_thunk\0"
	"mutex_lock\0"
	"mutex_unlock\0"
	"iowrite8\0"
	"devm_kmalloc\0"
	"__mutex_init\0"
	"module_layout\0"
;

MODULE_INFO(depends, "");


MODULE_INFO(srcversion, "F583F31F3C2EC839C572994");
