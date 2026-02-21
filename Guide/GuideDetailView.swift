//
//  GuideDetailView.swift
//  iSight
//
//  Created by Anuj   on 01/02/26.
//

import SwiftUI

struct GuideDetailView: View {
    let guide: GuideItem

    var body: some View {
        ReusableDetailView(content: guide)
    }
}
