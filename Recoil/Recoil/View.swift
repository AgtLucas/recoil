//
//  View.swift
//  Recoil
//
//  Created by Leland Richardson on 12/12/17.
//  Copyright © 2017 Leland Richardson. All rights reserved.
//

import Foundation
import UIKit
import YogaKit

public class ViewProps {
  var style: Style?
  var children: Element?
  public init() {}
  public func style(_ value: Style?) -> Self {
    style = value
    return self
  }
  public func children(_ value: Element?) -> Self {
    children = value
    return self
  }
}

final public class View: HostComponent<ViewProps, ViewHostView> {
  override public func mountComponent() -> ViewHostView {
    let view = ViewHostView()
    let layout = view.yoga
    layout.isEnabled = true
    applyProps(view: view, props: props)
    return view
  }

  override public func updateComponent(view: ViewHostView, prevProps: ViewProps) {
    applyProps(view: view, props: props)
  }

  private func applyProps(view: ViewHostView, props: ViewProps) {
    if let style = props.style {
      style.applyTo(view: view)
    }
  }

  override public func renderChildren() -> Element? {
    return props.children
  }
}
