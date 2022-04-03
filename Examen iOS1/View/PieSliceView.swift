//
//  PieSliceView.swift
//  Examen iOS1
//
//  Created by Aeron on 02/04/22.
//

import SwiftUI

struct PieSliceView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
}

struct PieSliceView_Previews: PreviewProvider {
    static var previews: some View {
        PieSliceView()
    }
}
