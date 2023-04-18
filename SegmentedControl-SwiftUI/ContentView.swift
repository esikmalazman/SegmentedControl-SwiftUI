//
//  ContentView.swift
//  SegmentedControl-SwiftUI
//
//  Created by Ikmal Azman on 18/04/2023.
// Sean Allen : SwiftUI Segmented Control Tutorial | iOS 14 | Xcode 12.4
// https://www.youtube.com/watch?v=iqKmgs_0VPE

import SwiftUI

/// CaseIterable : a Procotol that allow to access the enum as collection type through `.allCases` property.
enum HeroCharacter : String, CaseIterable, Identifiable {
    case pikachu = "Pikachu"
    case eevee = "Eevee"
    case celebi = "Celebi"
    var id: Self { self }
}

struct ContentView: View {
    init() {
        /// Allow to ovveride all UISegmentedControl UI appearance in the app
        UISegmentedControl.appearance().selectedSegmentTintColor = .systemIndigo
    }
    
    @State var selectedCharacter : HeroCharacter = .pikachu
    
    var body: some View {
        NavigationView {
            VStack {
                segmentedView
                Spacer()
                
                characterImageView
                Spacer()
            }
            .padding()
            .navigationTitle("Choose a Character")
        }
    }
    
    var segmentedView : some View {
        /// `Picker`: allow to create UISegmentedControl, UIDropdownMenu, UIPickerView in SwiftUI
        Picker("Choose a Character", selection: $selectedCharacter) {
            ForEach(HeroCharacter.allCases) { character in
                Text(character.rawValue)
            }
        }
        /// `pickerStyle`: a modifier that  allow to style the type of the picker
        .pickerStyle(.segmented)
    }
    
    var characterImageView : some View {
        Image(selectedCharacter.rawValue)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
