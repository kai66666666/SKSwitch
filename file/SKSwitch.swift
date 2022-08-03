//
//  SKSwitch.swift
//  Test
//
//  Created by sunkai on 2022/8/1.
//  Copyright © 2022 sunkai. All rights reserved.
//

import UIKit
import SnapKit

open class SKSwitch: UIView {
    //可以手动修改开关状态
    @objc open var autoChange = true {
        didSet {
            switchButton.isUserInteractionEnabled = autoChange
            button.isHidden = autoChange
        }
    }
    @objc public var switchButtonClick: ((SKSwitch) -> Void)?
    
    @objc open var isOn: Bool {
        get {
            return switchButton.isOn
        }
        set {
            setOn(newValue, animated: true)
        }
    }
    @objc open func setOn(_ on: Bool, animated: Bool)  {
        if autoChange == false {
            button.isEnabled = true
        }
        switchButton.setOn(on, animated: animated)
    }
    //选中颜色
    @objc open var onTintColor: UIColor? {
        get {
            return switchButton.onTintColor
        }
        set {
            switchButton.onTintColor = newValue
        }
    }
    //滑块颜色
    @objc open var thumbTintColor: UIColor? {
        get {
            return switchButton.thumbTintColor
        }
        set {
            switchButton.thumbTintColor = newValue
        }
    }

    /// switchButton
    private lazy var switchButton: UISwitch = {
        let result = UISwitch()
        return result
    }()
    /// button
    private lazy var button: UIButton = {
        let result = UIButton()
        result.isHidden = true
        return result
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
        setUpReactive()
    }
    /// UI
    private func setUpViews() {
        /// switchButton
        addSubview(switchButton)
        /// button
        addSubview(button)
    }
    /// 布局
    private func setUpConstraints() {
        /// switchButton
        switchButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        /// button
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    /// 事件
    private func setUpReactive() {
        /// switchButton
        switchButton.addTarget(self, action: #selector(buttonClick), for: .valueChanged)
        /// button
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
    }
    @objc private func buttonClick() {
        if autoChange == false {
            button.isEnabled = false
        }
        switchButtonClick?(self)
    }
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
