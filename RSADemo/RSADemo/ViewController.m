//
//  ViewController.m
//  RSADemo
//
//  Created by frank on 2020/3/1.
//  Copyright © 2020 frank. All rights reserved.
//

#import "ViewController.h"
#import "RSACryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //1. 加载公钥
    [[RSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil]];
    
    //2. 加载私钥
    [[RSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil] password:@"123456"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1. 加密
    NSData *result = [[RSACryptor sharedRSACryptor] encryptData:[@"hello" dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"加密的结果是：%@",[result base64EncodedDataWithOptions:0]);
    
    // 2. 解密
    NSData *jiemi = [[RSACryptor sharedRSACryptor] decryptData:result];
    NSLog(@"解密的结果： %@",[[NSString alloc] initWithData:jiemi encoding:NSUTF8StringEncoding]);
}

@end
