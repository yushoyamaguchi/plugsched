#include <linux/module.h>
#include <linux/init.h>



MODULE_LICENSE("Dual BSD/GPL");


static int test_init(void)
{
    printk("Hello my test_module\n");
    return 0;
}

static void test_exit(void)
{
    printk("Bye bye my test_module\n");
}

void print_test(void)
{
    printk("print_test\n");
}

EXPORT_SYMBOL(print_test);

module_init(test_init);
module_exit(test_exit);