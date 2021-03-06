// Generated by Apple Swift version 4.0.2 (swiftlang-900.0.69.2 clang-900.0.38)
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_attribute(external_source_symbol)
# define SWIFT_STRINGIFY(str) #str
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name) _Pragma(SWIFT_STRINGIFY(clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in=module_name, generated_declaration))), apply_to=any(function, enum, objc_interface, objc_category, objc_protocol))))
# define SWIFT_MODULE_NAMESPACE_POP _Pragma("clang attribute pop")
#else
# define SWIFT_MODULE_NAMESPACE_PUSH(module_name)
# define SWIFT_MODULE_NAMESPACE_POP
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR __attribute__((enum_extensibility(open)))
# else
#  define SWIFT_ENUM_ATTR
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if __has_feature(modules)
@import ObjectiveC;
@import Foundation;
@import UIKit;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

SWIFT_MODULE_NAMESPACE_PUSH("PKHUD")
@class UIView;
@class UIVisualEffect;

/// The PKHUD object controls showing and hiding of the HUD, as well as its contents and touch response behavior.
SWIFT_CLASS("_TtC5PKHUD5PKHUD")
@interface PKHUD : NSObject
@property (nonatomic, strong) UIView * _Nullable viewToPresentOn SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.viewToPresentOn' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
/// Grace period is the time (in seconds) that the invoked method may be run without
/// showing the HUD. If the task finishes before the grace time runs out, the HUD will
/// not be shown at all.
/// This may be used to prevent HUD display for very short tasks.
/// Defaults to 0 (no grace time).
@property (nonatomic) NSTimeInterval graceTime SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.graceTime' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
/// Grace period is the time (in seconds) that the invoked method may be run without
/// showing the HUD. If the task finishes before the grace time runs out, the HUD will
/// not be shown at all.
/// This may be used to prevent HUD display for very short tasks.
/// Defaults to 0 (no grace time).
@property (nonatomic) NSTimeInterval gracePeriod SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.gracePeriod' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) PKHUD * _Nonnull sharedHUD SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.sharedHUD' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");)
+ (PKHUD * _Nonnull)sharedHUD SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.sharedHUD' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithViewToPresentOn:(UIView * _Nonnull)view SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUD.init(viewToPresentOn:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@property (nonatomic) BOOL dimsBackground SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.dimsBackground' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@property (nonatomic) BOOL userInteractionOnUnderlyingViewsEnabled SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.userInteractionOnUnderlyingViewsEnabled' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@property (nonatomic, readonly) BOOL isVisible SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.isVisible' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@property (nonatomic, strong) UIView * _Nonnull contentView SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.contentView' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@property (nonatomic, strong) UIVisualEffect * _Nullable effect SWIFT_DEPRECATED_OBJC("Swift property 'PKHUD.effect' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)showOnView:(UIView * _Nullable)view SWIFT_DEPRECATED_OBJC("Swift method 'PKHUD.show(onView:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)hideWithAnimated:(BOOL)anim completion:(void (^ _Nullable)(BOOL))completion SWIFT_DEPRECATED_OBJC("Swift method 'PKHUD.hide(animated:completion:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)hide:(BOOL)animated completion:(void (^ _Nullable)(BOOL))completion SWIFT_DEPRECATED_OBJC("Swift method 'PKHUD.hide(_:completion:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)hideAfterDelay:(NSTimeInterval)delay completion:(void (^ _Nullable)(BOOL))completion SWIFT_DEPRECATED_OBJC("Swift method 'PKHUD.hide(afterDelay:completion:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


SWIFT_PROTOCOL("_TtP5PKHUD14PKHUDAnimating_")
@protocol PKHUDAnimating
- (void)startAnimation;
@optional
- (void)stopAnimation;
@end

@class UIImage;

/// PKHUDAssets provides a set of default images, that can be supplied to the PKHUD’s content views.
SWIFT_CLASS("_TtC5PKHUD11PKHUDAssets")
@interface PKHUDAssets : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) UIImage * _Nonnull crossImage SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDAssets.crossImage' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");)
+ (UIImage * _Nonnull)crossImage SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDAssets.crossImage' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) UIImage * _Nonnull checkmarkImage SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDAssets.checkmarkImage' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");)
+ (UIImage * _Nonnull)checkmarkImage SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDAssets.checkmarkImage' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) UIImage * _Nonnull progressActivityImage SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDAssets.progressActivityImage' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");)
+ (UIImage * _Nonnull)progressActivityImage SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDAssets.progressActivityImage' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) UIImage * _Nonnull progressCircularImage SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDAssets.progressCircularImage' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");)
+ (UIImage * _Nonnull)progressCircularImage SWIFT_WARN_UNUSED_RESULT SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDAssets.progressCircularImage' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSCoder;
@class UIImageView;
@class UILabel;

/// PKHUDSquareBaseView provides a square view, which you can subclass and add additional views to.
SWIFT_CLASS("_TtC5PKHUD19PKHUDSquareBaseView")
@interface PKHUDSquareBaseView : UIView
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle OBJC_DESIGNATED_INITIALIZER SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDSquareBaseView.init(image:title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@property (nonatomic, readonly, strong) UIImageView * _Nonnull imageView SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDSquareBaseView.imageView' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@property (nonatomic, readonly, strong) UILabel * _Nonnull titleLabel SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDSquareBaseView.titleLabel' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@property (nonatomic, readonly, strong) UILabel * _Nonnull subtitleLabel SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDSquareBaseView.subtitleLabel' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (void)layoutSubviews;
@end


/// PKHUDErrorView provides an animated error (cross) view.
SWIFT_CLASS("_TtC5PKHUD14PKHUDErrorView")
@interface PKHUDErrorView : PKHUDSquareBaseView <PKHUDAnimating>
- (nonnull instancetype)initWithTitle:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle OBJC_DESIGNATED_INITIALIZER SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDErrorView.init(title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)startAnimation;
- (void)stopAnimation;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle SWIFT_UNAVAILABLE SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDErrorView.init(image:title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


/// PKHUDProgressView provides an indeterminate progress view.
SWIFT_CLASS("_TtC5PKHUD17PKHUDProgressView")
@interface PKHUDProgressView : PKHUDSquareBaseView <PKHUDAnimating>
- (nonnull instancetype)initWithTitle:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle OBJC_DESIGNATED_INITIALIZER SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDProgressView.init(title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)startAnimation;
- (void)stopAnimation;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle SWIFT_UNAVAILABLE SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDProgressView.init(image:title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


/// PKHUDRotatingImageView provides a content view that rotates the supplied image automatically.
SWIFT_CLASS("_TtC5PKHUD22PKHUDRotatingImageView")
@interface PKHUDRotatingImageView : PKHUDSquareBaseView <PKHUDAnimating>
- (void)startAnimation;
- (void)stopAnimation;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle OBJC_DESIGNATED_INITIALIZER SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDRotatingImageView.init(image:title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end



/// PKHUDCheckmarkView provides an animated success (checkmark) view.
SWIFT_CLASS("_TtC5PKHUD16PKHUDSuccessView")
@interface PKHUDSuccessView : PKHUDSquareBaseView <PKHUDAnimating>
- (nonnull instancetype)initWithTitle:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle OBJC_DESIGNATED_INITIALIZER SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDSuccessView.init(title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)startAnimation;
- (void)stopAnimation;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle SWIFT_UNAVAILABLE SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDSuccessView.init(image:title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


/// PKHUDSystemActivityIndicatorView provides the system UIActivityIndicatorView as an alternative.
SWIFT_CLASS("_TtC5PKHUD32PKHUDSystemActivityIndicatorView")
@interface PKHUDSystemActivityIndicatorView : PKHUDSquareBaseView <PKHUDAnimating>
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
- (void)startAnimation;
- (nonnull instancetype)initWithImage:(UIImage * _Nullable)image title:(NSString * _Nullable)title subtitle:(NSString * _Nullable)subtitle SWIFT_UNAVAILABLE SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDSystemActivityIndicatorView.init(image:title:subtitle:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
@end


/// PKHUDWideBaseView provides a wide base view, which you can subclass and add additional views to.
SWIFT_CLASS("_TtC5PKHUD17PKHUDWideBaseView")
@interface PKHUDWideBaseView : UIView
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end


/// PKHUDTextView provides a wide, three line text view, which you can use to display information.
SWIFT_CLASS("_TtC5PKHUD13PKHUDTextView")
@interface PKHUDTextView : PKHUDWideBaseView
- (nonnull instancetype)initWithText:(NSString * _Nullable)text OBJC_DESIGNATED_INITIALIZER SWIFT_DEPRECATED_OBJC("Swift initializer 'PKHUDTextView.init(text:)' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)layoutSubviews;
@property (nonatomic, readonly, strong) UILabel * _Nonnull titleLabel SWIFT_DEPRECATED_OBJC("Swift property 'PKHUDTextView.titleLabel' uses '@objc' inference deprecated in Swift 4; add '@objc' to provide an Objective-C entrypoint");
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
- (nonnull instancetype)initWithFrame:(CGRect)frame SWIFT_UNAVAILABLE;
@end


SWIFT_MODULE_NAMESPACE_POP
#pragma clang diagnostic pop
