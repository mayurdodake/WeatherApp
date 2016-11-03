//
//  ViewController.m
//  MayurWeatherApp
//
//  Created by apple on 20/09/16.
//  Copyright © 2016 felix-its. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "Weather.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _mydata=[[NSMutableData alloc]init];
//    
//    TableViewController *t=[[TableViewController alloc]init];
//    
    
    
    
    NSLog(@"%@",_url);
    
    NSURL *url=[NSURL URLWithString:_url];
    
    NSMutableURLRequest  *req=[NSMutableURLRequest requestWithURL:url];
    req.HTTPMethod=@"GET";
    
    [NSURLConnection connectionWithRequest:req delegate:self];
    
    
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    
    [_mydata setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;
{
    
    [_mydata appendData:data];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:_mydata options:NSJSONReadingAllowFragments error:nil];
    
    NSDictionary *dictionary=[dic objectForKey:@"main"];
    
   Weather *w=[[Weather alloc]init];
    
    w.temp=[[dictionary objectForKey:@"temp"]description];
    w.pressure=[[dictionary objectForKey:@"pressure"]description];
    w.humidity=[[dictionary objectForKey:@"humidity"]description];
    
    NSLog(@"%@",w.temp);
    
    
    _templbl.text=w.temp;
    _pressurelbl.text=w.pressure;
    _humiditylbl.text=w.humidity;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
