import SwiftUI
///Comentario
struct ContentView: View {
    @State private var currentTime = Date()

    private var cameraView: some View {
        Color.red // Fondo gris para simular la cámara
            .frame(maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }

    private var timeLabel: some View {
        Text(currentTime, style: .time)
            .font(.system(size: 30))
            .padding()
            .background(Color.black.opacity(0.7))
            .foregroundColor(.white)
            .cornerRadius(10)
            .frame(maxWidth: .infinity) // Ocupa todo el ancho disponible
            .padding(.horizontal) // Margen opcional en los lados
    }

    var body: some View {
        VStack(spacing: 0) {
            cameraView
                .frame(height: UIScreen.main.bounds.height / 2) // Ocupa la mitad superior

            VStack {
                timeLabel
            }
            .frame(maxWidth: .infinity, maxHeight: UIScreen.main.bounds.height / 2) // Ocupa toda la mitad inferior
            .background(Color.black.opacity(0.7)) // Fondo que cubre toda la mitad inferior
        }
        .onAppear(perform: updateTime)
    }

    private func updateTime() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.currentTime = Date()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

