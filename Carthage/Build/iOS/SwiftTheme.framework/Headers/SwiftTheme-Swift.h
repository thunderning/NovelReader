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
@import QuartzCore;
@import ObjectiveC;
@import Foundation;
@import CoreGraphics;
@import UIKit;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

SWIFT_MODULE_NAMESPACE_PUSH("SwiftTheme")
@class ThemeCGColorPicker;
@class ThemeCGFloatPicker;

@interface CALayer (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeCGColorPicker * _Nullable theme_backgroundColor;
@property (nonatomic, strong) ThemeCGFloatPicker * _Nullable theme_borderWidth;
@property (nonatomic, strong) ThemeCGColorPicker * _Nullable theme_borderColor;
@property (nonatomic, strong) ThemeCGColorPicker * _Nullable theme_shadowColor;
@end






SWIFT_CLASS("_TtC10SwiftTheme11ThemePicker")
@interface ThemePicker : NSObject <NSCopying>
- (id _Nonnull)copyWithZone:(struct _NSZone * _Nullable)zone SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


SWIFT_CLASS("_TtC10SwiftTheme37ThemeActivityIndicatorViewStylePicker")
@interface ThemeActivityIndicatorViewStylePicker : ThemePicker
@end






@interface ThemeActivityIndicatorViewStylePicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeActivityIndicatorViewStylePicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (ThemeActivityIndicatorViewStylePicker * _Nonnull)pickerWithStringStyles:(NSArray<NSString *> * _Nonnull)styles SWIFT_WARN_UNUSED_RESULT;
@end




SWIFT_CLASS("_TtC10SwiftTheme19ThemeBarStylePicker")
@interface ThemeBarStylePicker : ThemePicker
@end






@interface ThemeBarStylePicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeBarStylePicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (ThemeBarStylePicker * _Nonnull)pickerWithStringStyles:(NSArray<NSString *> * _Nonnull)styles SWIFT_WARN_UNUSED_RESULT;
@end




SWIFT_CLASS("_TtC10SwiftTheme18ThemeCGColorPicker")
@interface ThemeCGColorPicker : ThemePicker
@end




@interface ThemeCGColorPicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeCGColorPicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (ThemeCGColorPicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath map:(CGColorRef _Nullable (^ _Nonnull)(id _Nullable))map SWIFT_WARN_UNUSED_RESULT;
+ (ThemeCGColorPicker * _Nonnull)pickerWithColors:(NSArray<NSString *> * _Nonnull)colors SWIFT_WARN_UNUSED_RESULT;
@end




SWIFT_CLASS("_TtC10SwiftTheme18ThemeCGFloatPicker")
@interface ThemeCGFloatPicker : ThemePicker
@end






@interface ThemeCGFloatPicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeCGFloatPicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (ThemeCGFloatPicker * _Nonnull)pickerWithFloats:(NSArray<NSNumber *> * _Nonnull)floats SWIFT_WARN_UNUSED_RESULT;
@end




SWIFT_CLASS("_TtC10SwiftTheme16ThemeColorPicker")
@interface ThemeColorPicker : ThemePicker
@end



@class UIColor;

@interface ThemeColorPicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeColorPicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (ThemeColorPicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath map:(UIColor * _Nullable (^ _Nonnull)(id _Nullable))map SWIFT_WARN_UNUSED_RESULT;
+ (ThemeColorPicker * _Nonnull)pickerWithColors:(NSArray<NSString *> * _Nonnull)colors SWIFT_WARN_UNUSED_RESULT;
@end




SWIFT_CLASS("_TtC10SwiftTheme21ThemeDictionaryPicker")
@interface ThemeDictionaryPicker : ThemePicker
@end




@interface ThemeDictionaryPicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeDictionaryPicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath map:(NSDictionary<NSString *, id> * _Nullable (^ _Nonnull)(id _Nullable))map SWIFT_WARN_UNUSED_RESULT;
+ (ThemeDictionaryPicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath mapAttributes:(NSDictionary<NSAttributedStringKey, id> * _Nullable (^ _Nonnull)(id _Nullable))mapAttributes SWIFT_WARN_UNUSED_RESULT;
+ (ThemeDictionaryPicker * _Nonnull)pickerWithDicts:(NSArray<NSDictionary<NSString *, id> *> * _Nonnull)dicts SWIFT_WARN_UNUSED_RESULT;
+ (ThemeDictionaryPicker * _Nonnull)pickerWithAttributes:(NSArray<NSDictionary<NSAttributedStringKey, id> *> * _Nonnull)attributes SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC10SwiftTheme15ThemeFontPicker")
@interface ThemeFontPicker : ThemePicker
@end



@class UIFont;

@interface ThemeFontPicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeFontPicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath map:(UIFont * _Nullable (^ _Nonnull)(id _Nullable))map SWIFT_WARN_UNUSED_RESULT;
+ (ThemeFontPicker * _Nonnull)pickerWithFonts:(NSArray<UIFont *> * _Nonnull)fonts SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC10SwiftTheme16ThemeImagePicker")
@interface ThemeImagePicker : ThemePicker
@end





@class UIImage;

@interface ThemeImagePicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeImagePicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (ThemeImagePicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath map:(UIImage * _Nullable (^ _Nonnull)(id _Nullable))map SWIFT_WARN_UNUSED_RESULT;
+ (ThemeImagePicker * _Nonnull)pickerWithNames:(NSArray<NSString *> * _Nonnull)names SWIFT_WARN_UNUSED_RESULT;
+ (ThemeImagePicker * _Nonnull)pickerWithImages:(NSArray<UIImage *> * _Nonnull)images SWIFT_WARN_UNUSED_RESULT;
@end


SWIFT_CLASS("_TtC10SwiftTheme29ThemeKeyboardAppearancePicker")
@interface ThemeKeyboardAppearancePicker : ThemePicker
@end




@interface ThemeKeyboardAppearancePicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeKeyboardAppearancePicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (ThemeKeyboardAppearancePicker * _Nonnull)pickerWithStringStyles:(NSArray<NSString *> * _Nonnull)styles SWIFT_WARN_UNUSED_RESULT;
@end





@class NSDictionary;

SWIFT_CLASS("_TtC10SwiftTheme12ThemeManager")
@interface ThemeManager : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class) double animationDuration;)
+ (double)animationDuration SWIFT_WARN_UNUSED_RESULT;
+ (void)setAnimationDuration:(double)value;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) NSDictionary * _Nullable currentTheme;)
+ (NSDictionary * _Nullable)currentTheme SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly) NSInteger currentThemeIndex;)
+ (NSInteger)currentThemeIndex SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end




@interface ThemeManager (SWIFT_EXTENSION(SwiftTheme))
+ (void)setThemeWithIndex:(NSInteger)index;
@end


@interface ThemeManager (SWIFT_EXTENSION(SwiftTheme))
/// extension for Objective-C, Use setTheme(plistName: String, path: ThemePath) in Swift
+ (void)setThemeWithPlistInMainBundle:(NSString * _Nonnull)plistName;
/// extension for Objective-C, Use setTheme(plistName: String, path: ThemePath) in Swift
+ (void)setThemeWithPlistInSandbox:(NSString * _Nonnull)plistName path:(NSURL * _Nonnull)path;
/// extension for Objective-C, Use setTheme(dict: NSDictionary, path: ThemePath) in Swift
+ (void)setThemeWithDictInMainBundle:(NSDictionary * _Nonnull)dict;
/// extension for Objective-C, Use setTheme(dict: NSDictionary, path: ThemePath) in Swift
+ (void)setThemeWithDictInSandbox:(NSDictionary * _Nonnull)dict path:(NSURL * _Nonnull)path;
@end

@class NSNumber;

@interface ThemeManager (SWIFT_EXTENSION(SwiftTheme))
+ (id _Nullable)valueFor:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (NSString * _Nullable)stringFor:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (NSNumber * _Nullable)numberFor:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (NSDictionary * _Nullable)dictionaryFor:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (UIColor * _Nullable)colorFor:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (UIImage * _Nullable)imageFor:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
@end



SWIFT_CLASS("_TtC10SwiftTheme25ThemeStatusBarStylePicker")
@interface ThemeStatusBarStylePicker : ThemePicker
@end






@interface ThemeStatusBarStylePicker (SWIFT_EXTENSION(SwiftTheme))
+ (ThemeStatusBarStylePicker * _Nonnull)pickerWithKeyPath:(NSString * _Nonnull)keyPath SWIFT_WARN_UNUSED_RESULT;
+ (ThemeStatusBarStylePicker * _Nonnull)pickerWithStringStyles:(NSArray<NSString *> * _Nonnull)styles SWIFT_WARN_UNUSED_RESULT;
@end






@interface UIApplication (SWIFT_EXTENSION(SwiftTheme))
- (void)theme_setStatusBarStyle:(ThemeStatusBarStylePicker * _Nonnull)picker animated:(BOOL)animated;
@end


@interface UIBarButtonItem (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_tintColor;
@end


@interface UIButton (SWIFT_EXTENSION(SwiftTheme))
- (void)theme_setImage:(ThemeImagePicker * _Nullable)picker forState:(UIControlState)state;
- (void)theme_setBackgroundImage:(ThemeImagePicker * _Nullable)picker forState:(UIControlState)state;
- (void)theme_setTitleColor:(ThemeColorPicker * _Nullable)picker forState:(UIControlState)state;
@end


@interface UIColor (SWIFT_EXTENSION(SwiftTheme))
/// The shorthand three-digit hexadecimal representation of color.
/// #RGB defines to the color #RRGGBB.
/// \param hex3 Three-digit hexadecimal value.
///
/// \param alpha 0.0 - 1.0. The default is 1.0.
///
- (nonnull instancetype)initWithHex3:(uint16_t)hex3 alpha:(CGFloat)alpha;
/// The shorthand four-digit hexadecimal representation of color with alpha.
/// #RGBA defines to the color #RRGGBBAA.
/// \param hex4 Four-digit hexadecimal value.
///
- (nonnull instancetype)initWithHex4:(uint16_t)hex4;
/// The six-digit hexadecimal representation of color of the form #RRGGBB.
/// \param hex6 Six-digit hexadecimal value.
///
- (nonnull instancetype)initWithHex6:(uint32_t)hex6 alpha:(CGFloat)alpha;
/// The six-digit hexadecimal representation of color with alpha of the form #RRGGBBAA.
/// \param hex8 Eight-digit hexadecimal value.
///
- (nonnull instancetype)initWithHex8:(uint32_t)hex8;
/// The rgba string representation of color with alpha of the form #RRGGBBAA/#RRGGBB, throws error.
/// \param rgba String value.
///
- (nullable instancetype)initWithRgba_throws:(NSString * _Nonnull)rgba error:(NSError * _Nullable * _Nullable)error;
/// The rgba string representation of color with alpha of the form #RRGGBBAA/#RRGGBB, fails to default color.
/// \param rgba String value.
///
- (nonnull instancetype)initWithRgba:(NSString * _Nonnull)rgba defaultColor:(UIColor * _Nonnull)defaultColor;
/// Hex string of a UIColor instance.
/// \param rgba Whether the alpha should be included.
///
- (NSString * _Nonnull)hexString:(BOOL)includeAlpha SWIFT_WARN_UNUSED_RESULT;
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
@property (nonatomic, readonly, copy) NSString * _Nonnull debugDescription;
@end


@interface UIImageView (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeImagePicker * _Nullable theme_image;
@end


@interface UILabel (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeFontPicker * _Nullable theme_font;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_textColor;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_highlightedTextColor;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_shadowColor;
@end


@interface UINavigationBar (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeBarStylePicker * _Nullable theme_barStyle;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_barTintColor;
@property (nonatomic, strong) ThemeDictionaryPicker * _Nullable theme_titleTextAttributes;
@end


@interface UIPageControl (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_pageIndicatorTintColor;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_currentPageIndicatorTintColor;
@end


@interface UIProgressView (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_progressTintColor;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_trackTintColor;
@end


@interface UISearchBar (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeBarStylePicker * _Nullable theme_barStyle;
@property (nonatomic, strong) ThemeKeyboardAppearancePicker * _Nullable theme_keyboardAppearance;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_barTintColor;
@end


@interface UISlider (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_thumbTintColor;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_minimumTrackTintColor;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_maximumTrackTintColor;
@end


@interface UISwitch (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_onTintColor;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_thumbTintColor;
@end


@interface UITabBar (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeBarStylePicker * _Nullable theme_barStyle;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_barTintColor;
@end


@interface UITableView (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_separatorColor;
@end


@interface UITextField (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeFontPicker * _Nullable theme_font;
@property (nonatomic, strong) ThemeKeyboardAppearancePicker * _Nullable theme_keyboardAppearance;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_textColor;
@end


@interface UITextView (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeFontPicker * _Nullable theme_font;
@property (nonatomic, strong) ThemeKeyboardAppearancePicker * _Nullable theme_keyboardAppearance;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_textColor;
@end


@interface UIToolbar (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeBarStylePicker * _Nullable theme_barStyle;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_barTintColor;
@end


@interface UIView (SWIFT_EXTENSION(SwiftTheme))
@property (nonatomic, strong) ThemeCGFloatPicker * _Nullable theme_alpha;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_backgroundColor;
@property (nonatomic, strong) ThemeColorPicker * _Nullable theme_tintColor;
@end

SWIFT_MODULE_NAMESPACE_POP
#pragma clang diagnostic pop
