//
//  ViewController.m
//  ASIHTTPRequestTest1
//
//  Created by Civet on 2020/3/31.
//  Copyright © 2020 PersonalONBYL. All rights reserved.
//

#import "ViewController.h"
#import "ASIHTTPRequest.h"

@interface ViewController ()

@property (nonatomic,strong) NSString *url;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _url = @"https://3g.163.com/touch/reconstruct/article/list/BA10TA81wangning/0-20.html";
    // Do any additional setup after loading the view.
    
    //_originalClass = (int)object_getClass(self.delegate);
    //NSString *msgLength=[NSString stringWithFormat:@"%lu",(unsigned long)[msgData length]];
    //[self ASIHttpRequestLog:[self bindSourceUrl:URL] method:@"PUT"];
    //[self startAsynchronous];
    [self startSynchronous1];
}


- (void)startSynchronous{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:self.url]];
    //    NSURL *url = [NSURL URLWithString:UpdateURL];
    //    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [request setValidatesSecureCertificate:NO];
    //    [request addRequestHeader:@"Host" value:WEB_REQUEST_HOST];
    [request addRequestHeader:@"Content-Type" value:@"text/plain; charset=UTF-8"];
    //[request addRequestHeader:@"Content-Length" value:msgLength];
    [request setRequestMethod:@"GET"];
    //[request appendPostData:[msgData dataUsingEncoding:NSUTF8StringEncoding]];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    //[request setDelegate:self];1
    [request startSynchronous];
    NSString *responseStr = [request responseString];
    NSLog(@"ASIHTTPRequest: Response: %@", responseStr);
    NSData *data  = [request responseData];
    //data转字典
    NSDictionary *resDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil] ;
}

- (void)startAsynchronous{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:self.url]];
    //    NSURL *url = [NSURL URLWithString:UpdateURL];
    //    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [request setValidatesSecureCertificate:NO];
    //    [request addRequestHeader:@"Host" value:WEB_REQUEST_HOST];
    [request addRequestHeader:@"Content-Type" value:@"text/plain; charset=UTF-8"];
    //[request addRequestHeader:@"Content-Length" value:msgLength];
    [request setRequestMethod:@"GET"];
    //[request appendPostData:[msgData dataUsingEncoding:NSUTF8StringEncoding]];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    //[request setDelegate:self];1
    [request setDelegate:self];
    [request startAsynchronous];
    NSString *responseStr = [request responseString];
    NSLog(@"ASIHTTPRequest: Response: %@", responseStr);
}

- (void)startSynchronous1{
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:self.url]];
    //    NSURL *url = [NSURL URLWithString:UpdateURL];
    //    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [request setValidatesSecureCertificate:NO];
    //    [request addRequestHeader:@"Host" value:WEB_REQUEST_HOST];
    [request addRequestHeader:@"Content-Type" value:@"text/plain; charset=UTF-8"];
    //[request addRequestHeader:@"Content-Length" value:msgLength];
    [request setRequestMethod:@"GET"];
    //[request appendPostData:[msgData dataUsingEncoding:NSUTF8StringEncoding]];
    [request setDefaultResponseEncoding:NSUTF8StringEncoding];
    //[request setDelegate:self];1
    [request setDelegate:self];
    [request startSynchronous];
    NSString *responseStr = [request responseString];
    NSLog(@"ASIHTTPRequest: Response: %@", responseStr);
}

- (void)requestFinished:(ASIHTTPRequest *)request{
    NSLog(@"responseStatusCode------%i",request.responseStatusCode);
    NSLog(@"responseStatusMessage------%@",request.responseStatusMessage);
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    NSError *error = [request error];
    NSLog(@"%@", error.localizedDescription);
}

@end
