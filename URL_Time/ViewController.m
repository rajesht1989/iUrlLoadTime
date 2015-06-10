//
//  ViewController.m
//  URL_Time
//
//  Created by Rajesh on 30/04/14.
//

#import "ViewController.h"

@interface ViewController (){
    NSDate *dateState;
}
@property (weak, nonatomic) IBOutlet UITextField *textField;
- (IBAction)btnTapped:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIView *webView;
@property (weak, nonatomic) IBOutlet UIWebView *objWebVIew;



@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnTapped:(UIButton *)sender {
    [[self view] endEditing:YES];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.textField.text]];
    
    [self.objWebVIew loadRequest:request];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    dateState = [NSDate date];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSString *strMessage = [NSString stringWithFormat:@"Started :%@ \n Ended: %@ \n Difference : %f",dateState,[NSDate date],[[NSDate date] timeIntervalSinceDate:dateState]];
    [[[UIAlertView alloc]initWithTitle:@"Web view done" message:strMessage delegate:Nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}

@end
