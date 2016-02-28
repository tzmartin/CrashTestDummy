#include <jni.h>
#include <stdio.h>
#include <stdlib.h>
//#include <v8.h>

extern "C" {

char * marker = "HOOBA HOOBA WAKKA WAKKA WARGH WARGH";

/*
 * Class:     ti_crashtestdummy_CrashtestdummyandroidModule
 * Method:    nativeBadMemory
 * Signature: ()Ljava/lang/Object;
 */
JNIEXPORT jobject JNICALL Java_ti_crashtestdummy_CrashtestdummyandroidModule_nativeBadMemory(JNIEnv *env, jobject jEmitter)
{
	int *badMem = (int *) -1;
	int crasher = *badMem;
	printf("We tried to access %d",crasher);
	return (jobject)crasher;
}

/*
 * Class:     ti_crashtestdummy_CrashtestdummyandroidModule
 * Method:    nativeOverReleaseMemory
 * Signature: ()Ljava/lang/Object;
 */
JNIEXPORT jobject JNICALL Java_ti_crashtestdummy_CrashtestdummyandroidModule_nativeOverReleaseMemory(JNIEnv *env, jobject jEmitter)
{
	int * ram = malloc(4096);
	free(ram);
	free(ram);
	free(ram);
	free(ram);
	printf("We overfreed memory %d",*ram);
	return (jobject)ram[501];
}

}

