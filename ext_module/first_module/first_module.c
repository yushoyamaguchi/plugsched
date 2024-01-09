#include <linux/module.h>
#include <linux/init.h>

#include "/work5/scheduler/kernel/sched/mod/sched_mod.h"

MODULE_LICENSE("Dual BSD/GPL");


static int test_init(void)
{
    printk("Hello my first_module\n");
    //test_print_sched();
    return 0;
}

static void test_exit(void)
{
    printk("Bye bye my module\n");
}

module_init(test_init);
module_exit(test_exit);