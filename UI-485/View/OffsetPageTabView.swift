//
//  OffsetPageTabView.swift
//  UI-485
//
//  Created by nyannyan0328 on 2022/02/28.
//

import SwiftUI

struct OffsetPageTabView<Content : View>: UIViewRepresentable {
    
    var content : Content
    @Binding var offset : CGFloat
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    init(offset : Binding<CGFloat>,@ViewBuilder content : @escaping()->Content) {
        
        self.content = content()
        self._offset = offset
    }
    
  
    func makeUIView(context: Context) -> UIScrollView {
        
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = false
        scroll.showsHorizontalScrollIndicator = false
        scroll.isPagingEnabled = true
        scroll.delegate = context.coordinator
        
        let hostView = UIHostingController(rootView: content)
        
        hostView.view.backgroundColor = .clear
        
        hostView.view.translatesAutoresizingMaskIntoConstraints = false
        
        let contains = [
        
        
            hostView.view.topAnchor.constraint(equalTo: scroll.topAnchor),
            hostView.view.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            hostView.view.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
        
            hostView.view.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
            
            hostView.view.heightAnchor.constraint(equalTo: scroll.heightAnchor),
        
        
        
        ]
        
        scroll.addConstraints(contains)
        scroll.addSubview(hostView.view)
        
        
        
        
        
        return scroll
        
    }
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        let cuurentOffset = uiView.contentOffset.x
        
        if offset != cuurentOffset{
            
            
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
            
        }
        
        
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        
        var parent : OffsetPageTabView
        
        init(parent : OffsetPageTabView) {
            self.parent = parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            
            let offset = scrollView.contentOffset.x
            parent.offset = offset
            
        }
    }
    
}

