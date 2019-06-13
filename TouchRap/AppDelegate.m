//
//  AppDelegate.m
//  TouchRap
//
//  Created by Brian Menasco on 6/13/19.
//  Copyright © 2019 Brian Menasco. All rights reserved.
//

#import "AppDelegate.h"
#import "TouchBar.h"

static const NSTouchBarItemIdentifier kHornIdentifier = @"rap.horn";

@interface AppDelegate () <NSTouchBarDelegate>

@end

@implementation AppDelegate

NSSound *sound;

- (void)playSound:()sender
{
    if([sound isPlaying]) {
        sound.currentTime = .1;
    } else {
        [sound play];
    }
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    sound = [NSSound soundNamed:@"horn"];
    NSCustomTouchBarItem *horn = [[NSCustomTouchBarItem alloc] initWithIdentifier:kHornIdentifier];
    horn.view = [NSButton buttonWithTitle:@"📢" target:self action: @selector(playSound:)];
    [NSTouchBarItem addSystemTrayItem:horn];
    DFRElementSetControlStripPresenceForIdentifier(kHornIdentifier, YES);
}

@end
