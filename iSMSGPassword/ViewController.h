//
//  ViewController.h
//  iSMSGPassword
//
//  Created by Prabin K Datta on 30/09/15.
//  Copyright (c) 2015 Prabin Datta. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController<NSTextFieldDelegate>

@property (weak) IBOutlet NSTextField *iTxtFld;
@property (weak) IBOutlet NSTextField *oTxtFld;

- (IBAction)generatePassword:(id)sender;

@end

