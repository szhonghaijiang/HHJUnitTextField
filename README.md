# HHJUnitTextField
A swift textfield with unit.

A swift textfield with units. You can set the pre unit and the sub unit and keep the really UITextField which can be Interaction. The units can not be change.

# 如何在项目中导入
* HHJUnitTextField只有一个文件，就是HHJUnitTextField.swift，你可以把它直接拖进过程里面。
* 当然我是建议用cocospod导入的，用cocospod导入的最低版本是iOS8：
```
platform :ios, '8.0'
use_frameworks!

pod 'HHJUnitTextField', '~> 0.0.1'
```
# 如何在项目中使用
HHJUnitTextField有个便利构造器

public convenience init(pre: String? = default, suf: String?, frame: CGRect, fontSize: CGFloat)