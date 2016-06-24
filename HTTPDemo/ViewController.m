//
//  ViewController.m
//  HTTPDemo
//
//  Created by Mac on 16/6/24.
//  Copyright © 2016年 lyq. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDelegate>
{
    NSMutableData *_data;
    NSMutableArray*_dataArray;
    NSInteger newAdd;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURLConnection * connection=[NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://open3.bantangapp.com/recommend/index?app_installtime=1457339276.130753&app_versions=5.3.3&channel_name=appStore&client_id=bt_app_ios&client_secret=9c1e6634ce1c5098e056628cd66a17a5&device_token=82ad17a64076610542e79180507d30587b0fa7636e8abcc0ece491fe6b8dccba&oauth_token=d6be233c50ccf25dfb687f4184de944b&os_versions=9.1&page=0&pagesize=20"]] delegate:self];
}

#pragma mark~~~~~~~~~~~~~~~实现NSURL连接协议方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"~~~~~~~~~~~~~%@",error.localizedDescription);
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _data = [NSMutableData data];
    _dataArray=[NSMutableArray array];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_data appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSDictionary*dic=[NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary*dataDic=dic[@"data"];
    NSArray*topicArray=dataDic[@"topic"];
//    NSLog(@"%@",topicArray);
    for (NSDictionary*tempDic in topicArray) {
        NSString*picURL=tempDic[@"pic"];
        [_dataArray addObject:picURL];
    }
    NSLog(@"%@",_dataArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
