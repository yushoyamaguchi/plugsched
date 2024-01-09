#include <linux/module.h>
#include <linux/init.h>



MODULE_LICENSE("Dual BSD/GPL");


static int test_init(void)
{
    printk("Hello my first_module\n");
    //test_print_sched();

    extern void print_test(void);
    print_test();
    return 0;
}

static void test_exit(void)
{
    printk("Bye bye my first_module\n");
}

module_init(test_init);
module_exit(test_exit);