//
//  CustomTextFieldFormatter.h
//  iSMSGPassword
//
//  Created by Prabin K Datta on 01/10/15.
//  Copyright © 2015 Prabin Datta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomTextFieldFormatter : NSFormatter
{
    int maxLength;
}

- (void)setMaximumLength:(int)len;
- (int)maximumLength;


@end
