//
//  ServerProtocols.h
//  VFWifiSync
//
//  Created by victor on 1/4/15.
//  Copyright (c) 2015 VF. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkStatusDelegate <NSObject>

- (void) WifiStatusChanged: (BOOL)reachable;

@end
