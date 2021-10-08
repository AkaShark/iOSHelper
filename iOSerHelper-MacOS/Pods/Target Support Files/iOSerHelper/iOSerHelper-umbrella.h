#ifdef __OBJC__
#import <Cocoa/Cocoa.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "IHNetServiceBrowser.h"
#import "IHNetServicePublisher.h"
#import "iOSerHelper.h"

FOUNDATION_EXPORT double iOSerHelperVersionNumber;
FOUNDATION_EXPORT const unsigned char iOSerHelperVersionString[];

