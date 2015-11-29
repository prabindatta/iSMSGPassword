//
//  ViewController.m
//  iSMSGPassword
//
//  Created by Prabin K Datta on 30/09/15.
//  Copyright (c) 2015 Prabin Datta. All rights reserved.
//

#import "ViewController.h"
#import "CustomTextFieldFormatter.h"

#define MAX_LENGTH 8

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    CustomTextFieldFormatter *cFormatter = [[CustomTextFieldFormatter alloc] init];
    [cFormatter setMaximumLength:MAX_LENGTH];
    self.iTxtFld.formatter = cFormatter;
    self.oTxtFld.formatter = cFormatter;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

#pragma mark - DELEGATE
- (void)controlTextDidChange:(NSNotification *)obj
{
    self.oTxtFld.stringValue = @"";
    self.oTxtFld.textColor = [NSColor blackColor];
}

- (BOOL)control:(NSControl *)control textView:(NSTextView *)fieldEditor doCommandBySelector:(SEL)commandSelector
{
    NSLog(@"Selector method is (%@)", NSStringFromSelector( commandSelector ) );
    if (commandSelector == @selector(insertNewline:)) {
        //Do something against ENTER key
        [self generatePassword:nil];
        
    } else if (commandSelector == @selector(deleteForward:)) {
        //Do something against DELETE key
        
    } else if (commandSelector == @selector(deleteBackward:)) {
        //Do something against BACKSPACE key
        
    } else if (commandSelector == @selector(insertTab:)) {
        //Do something against TAB key
    }
    
    // return YES if the action was handled; otherwise NO
    return NO;
}

#pragma mark - ACTION
- (IBAction)generatePassword:(id)sender {
#ifdef DEBUG
    NSLog(@"generatePassword: %@",self.iTxtFld.stringValue);
#endif
    
    // Input
    NSString *iStr = self.iTxtFld.stringValue;
    NSString *oStr = @"";
    
    // Validation
    if([iStr length]!=MAX_LENGTH)
    {
        self.oTxtFld.stringValue = @"Invalid Input";
        self.oTxtFld.textColor = [NSColor redColor];
        return;
    }
    
    // Code Logic
    for (int i=0; i<iStr.length; i+=2) {
        unichar sChar = [iStr characterAtIndex:i+1];
        if(sChar == 'Z')
            sChar = 'A';
        else if(sChar == '9')
            sChar = '0';
        else
            sChar+=1;
        oStr = [oStr stringByAppendingFormat:@"%c",sChar];
        
        unichar fChar = [iStr characterAtIndex:i];
        if(fChar == 'Z')
            fChar = 'A';
        else if(fChar == '9')
            fChar = '0';
        else
            fChar+=1;
        oStr = [oStr stringByAppendingFormat:@"%c",fChar];
    }
    
    // Output
    self.oTxtFld.stringValue = oStr;
}

@end
