 /* 
 Settings.swift 

 Copyright (C) 2023, 2024 SparkleChan and SeanIsTethered 
 Copyright (C) 2024 fridakitten 

 This file is part of FridaCodeManager. 

 FridaCodeManager is free software: you can redistribute it and/or modify 
 it under the terms of the GNU General Public License as published by 
 the Free Software Foundation, either version 3 of the License, or 
 (at your option) any later version. 

 FridaCodeManager is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of 
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
 GNU General Public License for more details. 

 You should have received a copy of the GNU General Public License 
 along with FridaCodeManager. If not, see <https://www.gnu.org/licenses/>. 
 */ 
    
import SwiftUI

struct Settings: View {
    @Binding var sdk: String
    @Binding var font: CGFloat
    @Binding var bsl: Bool
    @Binding var fname: String
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("default sdk"), footer: Text("The sdk gets used when you create a new project.")) {
                    Text(sdk)
                    NavigationLink(destination: SDKList(directoryPath: "var/jb/opt/theos/sdks" ,sdk: $sdk)) {
                        Text("Change")
                    }
                }
                .onChange(of: font) { _ in
                    save()
                }
                Section(header: Text("Advanced")) {
                    NavigationLink(destination: textset(font: $font, bsl: $bsl, fname: $fname)) {
                        Text("Code Editor")
                    }
                }
                Section(header: Text("Additional Tools")) {
                    NavigationLink(destination: SFSymbolView()) {
                    Text("SFSymbols")
                }
                NavigationLink(destination: Packages()) {
                    Text("Frameworks (Experimental)")
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
        }
    }
    func save() {
        UserDefaults.standard.set(font, forKey: "savedfont")
    }
}
