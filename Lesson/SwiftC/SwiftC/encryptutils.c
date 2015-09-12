//
//  encryptutils.c
//  SwiftC
//
//  Created by fengsh on 17/8/15.
//  Copyright © 2015年 fengsh. All rights reserved.
//

#include "encryptutils.h"

#define MAX_LEN 1024
#define MAX_KEY_LEN 10
/* key必须是1-9之间的数字 */
/* 拥有K个字符的Key，包含且仅包含1-K */
int CheckKey(char*key)
{
    int i,check[MAX_KEY_LEN]={0};
    unsigned long max=strlen(key);
    int keyVal;
    for(i=0; i<max; i++)
    {
        keyVal = key[i]-'0';
        if(keyVal > max || keyVal < 1)
            return 0;
        if(check[keyVal]==1)
            return 0;
        else
            check[keyVal] = 1;
    }
    return 1;
}

int Encrypt( char* word, char* key, char* secretWord )
{
    int i,start;
    unsigned long nLenWord = strlen(word);
    unsigned long nLenKey = strlen(key);
    int index[MAX_KEY_LEN];
    if(nLenWord % nLenKey != 0)
    {
        printf("明文的位数不是密钥位数的整数倍！\n");
        return 0;
    }
    for(i=0; i<nLenKey; i++)
    {
        index[i] = key[i] - '0' -1;
    }
    /*START 关键代码*/
    start = 0;
    while(start < nLenWord)
    {
        for(i=0;i<nLenKey;i++)
        {
            secretWord[start + i] = word[start + index[i]];
        }
        start += nLenKey;
    }
    secretWord[nLenWord] = '\0';
    /* END 关键代码*/
    return 1;
}