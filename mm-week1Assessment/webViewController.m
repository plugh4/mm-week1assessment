//
//  webViewController.m
//  mm-week1Assessment
//
//  Created by Christopher Serra on 3/18/16.
//  Copyright © 2016 plugh. All rights reserved.
//

#import "webViewController.h"

@interface webViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // set delegates
    self.webView.delegate = self;
    
    // set title
    self.title = self.myTitleString;

    // load page
    NSString *defaultURL = @"http://www.mobilemakers.co";
    [self loadWebPage:defaultURL];
}

- (void) loadWebPage:(NSString *)urlAsString {
    if (![urlAsString containsString:@"http://"]) {
        urlAsString = [NSString stringWithFormat:@"http://%@", urlAsString];
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlAsString]];
    [self.webView loadRequest:request];
}


#pragma mark - UIWebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"didStartLoad()");
    [self.spinner startAnimating];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"didFinishLoad()");
    [self.spinner stopAnimating];
}
- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"didFailLoadWithError()");
    [self.spinner stopAnimating];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
