//
//  ContentView.swift
//  SpeedRunChallange
//
//  Created by Dmitry Tokarev on 22.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("samplePhoto")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()

            VStack {
                header()

                Spacer()

                zoomCarousel()

                footer()
            }
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width)
        }
    }

    func header() -> some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.6)
                .frame(height: 140)

            greenLight()
                .padding(.leading, 260)
                .padding(.top, 16)

            headerIcons()
                .padding(.horizontal, 16)
                .padding(.top, 60)
                .frame(maxWidth: .infinity)
        }
    }

    func headerIcons() -> some View {
        HStack {
            flashIcon()
            Spacer()
            chevronIcon()
            Spacer()
            liveIcon()
        }
    }

    func greenLight() -> some View {
        Circle()
            .frame(width: 5, height: 5)
            .foregroundColor(.green)
    }

    func liveIcon() -> some View {
        circleIconBackground()
            .overlay(
                Image("live")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
            )
    }

    func flashIcon() -> some View {
        circleIconBackground()
            .overlay(
                Image("ios-flash")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 20, height: 23)
            )
            .overlay(
                Circle()
                    .stroke(.white)
            )
    }

    func chevronIcon() -> some View {
        circleIconBackground()
            .overlay(
                Image(systemName: "chevron.up")
                    .foregroundColor(.white)
            )
    }

    func circleIconBackground() -> some View {
        ZStack {
            Circle()
                .foregroundColor(.gray)
                .opacity(0.4)
                .frame(width: 30, height: 30)
        }

    }

    func zoomCarousel() -> some View {
        HStack {
            zoomCircle("0,5")
                .frame(width: 35, height: 35)
            zoomCircle("1x", isActive: true)
                .frame(width: 45, height: 45)
            zoomCircle("3")
                .frame(width: 35, height: 35)
        }
    }

    func zoomCircle(_ text: String, isActive: Bool = false) -> some View {
        ZStack {
            Circle()
                .foregroundColor(.black)
                .opacity(0.5)
            Text(text)
                .foregroundColor(isActive ? .yellow : .white)
                .font(Font.system(size: 14))
                .fontWeight(.bold)
        }
    }

    func footer() -> some View {
        ZStack(alignment: .top) {
            Rectangle()
                .foregroundColor(.black)
                .opacity(0.7)
                .frame(height: 200)

            VStack {
                cameraModeCarusel()
                Spacer().frame(height: 25)
                HStack {
                    photoPreview()
                    Spacer()
                    camerButton()
                    Spacer()
                    changeCamera()
                }
            }
            .padding(16)
        }
    }

    func cameraModeCarusel() -> some View {
        HStack {
            cameraModeLabel("CINEMATIC")
            Spacer()
            cameraModeLabel("VIDEO")
            Spacer()
            cameraModeLabel("PHOTO", isActive: true)
            Spacer()
            cameraModeLabel("PORTRAIT")
            Spacer()
            cameraModeLabel("PANO")
        }
        .padding(.horizontal, 16)
    }

    func cameraModeLabel(_ text: String, isActive: Bool = false) -> some View {
        Text(text)
            .foregroundColor(isActive ? .yellow : .white)
            .font(.subheadline)
            .fontWeight(.bold)
    }

    func camerButton() -> some View {
        ZStack {
            Circle()
                .stroke(.white, lineWidth: 4)
                .frame(width: 80, height: 80)
                .foregroundColor(.white)

            Circle()
                .frame(width: 70, height: 70)
                .foregroundColor(.white)
        }
    }

    func photoPreview() -> some View {
        Image("samplePhoto")
            .resizable()
            .frame(width: 60, height: 60)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(5)
            .clipped()
    }

    func changeCamera() -> some View {
        ZStack {
            Circle()
                .foregroundColor(.gray)
                .opacity(0.3)
                .frame(width: 55, height: 55)

            Image(systemName: "arrow.triangle.2.circlepath")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 30, height: 25)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
