
#include <stdio.h>
#include <stdint.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include <string.h>
#include "ratp.h"

static const float Price = 1.2;

static int setup(void **state) {
    (void) state;
   printf("setUp");
 return 0;
}
static int teardown(void **state) {
    (void) state;
   printf("tearDown");
     return 0;
}

// Tests
static void null_test_success(void **state) {
    (void) state;
}
static void test_ratp(void **state) {
    (void) state;
    assert_float_equal(1.2,computePrice(20.0,0),0.001);
    // fail() ;
}
static void test_adulte_touriste(void** state) {
    (void) state;
    assert_float_equal(2*Price,computePrice(15,1),0.001) ;
}
static void test_adulte_local(void** state) {
    (void) state;
    assert_float_equal(Price,computePrice(15,0),0.001) ;
}
static void test_enfant_touriste(void** state) {
    (void) state;
    assert_float_equal(Price,computePrice(10,1),0.001) ;
}
static void test_enfant_local(void** state) {
    (void) state;
    assert_float_equal(Price/2,computePrice(10,0),0.001) ;
}




int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_adulte_local),
        cmocka_unit_test(test_adulte_touriste),
        cmocka_unit_test(test_enfant_local),
        cmocka_unit_test(test_enfant_touriste)
    };
    //cmocka_set_message_output(CM_OUTPUT_XML);
    // Dans bash : export CMOCKA_XML_FILE='./result.xml'
    return cmocka_run_group_tests_name("toto",tests, setup, teardown);
}
