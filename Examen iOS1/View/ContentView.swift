
//
//  CamaraView.swift
//  Examen iOS1
//
//  Created by Aeron on 29/03/22.
//

import SwiftUI
import AVFoundation

struct CamaraView: View {
   var body: some View {
       
       
       CameraView()
   }
}



struct CamaraView_Previews: PreviewProvider {
   static var previews: some View {
       CamaraView()
       
   }
}


struct CameraView: View {
   
   @StateObject var camera = CameraModel()
   
   var body: some View{
       
       ZStack{
           
           CameraPreview(camera: camera)
               .ignoresSafeArea(.all, edges: .all)
           
           VStack{
               
               if camera.isTaken{
                   
                   HStack {
                      
                       Spacer()
                       
                       Button(action: {}, label: {
                           
                           Image(systemName:
                           "arrow.triangle.2.circlepath.camera.fill")
                           .foregroundColor(.black)
                           .padding()
                           .background(Color.white)
                           .clipShape(Circle())
                           
                       })
                       .padding(.leading)
                   }
                   
           }
               
           Spacer()
               
           HStack{
                   
                   
               if camera.isTaken{
                   Button(action: {}, label: {
                       Text("Guardar")
                           .foregroundColor(.black)
                           .fontWeight(.semibold)
                           .padding(.vertical,10)
                           .padding(.horizontal,20)
                           .background(Color.white)
                           .clipShape(Capsule())
                       })
                       .padding(.leading)
                      
                     
                       Spacer()
                   }
                   else{
                       
                       Button(action: {camera.isTaken.toggle()}, label: {
                         
                           ZStack{
                               
                               Circle()
                                   .fill(Color.white)
                                   .frame(width: 65, height: 65)
                               
                               Circle()
                                   .stroke(Color.white,lineWidth: 2)
                                   .frame(width: 75, height: 75)
                               
                           }
                       })
                   }
                  
               }
               .frame(height: 75)
           }
       }
       .onAppear(perform: {
       
           camera.Check()
       })
   }
}
// Camera Model ...
class CameraModel: ObservableObject{
   
   @Published var isTaken = false
   
   @Published var session = AVCaptureSession()
   
   @Published var alert = false
   
   
   @Published var output = AVCapturePhotoOutput()
   
   //previww
   @Published var preview : AVCaptureVideoPreviewLayer!
   
   
   func Check(){
       
       switch AVCaptureDevice.authorizationStatus(for: .video) {
       case .authorized:
           setUp()
           return
       
       case .notDetermined:
       
           AVCaptureDevice.requestAccess(for: .video) { (status) in
               
               if status{
                   self.setUp()
               }
           }
       case .denied:
           self.alert.toggle()
       default:
           return
       }
   }
   
   func setUp(){
   
    do{
           
           self.session.beginConfiguration()
       
           let device = AVCaptureDevice.default(.builtInDualCamera,
               for: .video, position: .back)
           
           let input = try AVCaptureDeviceInput(device:
               device!)
       
           if self.session.canAddInput(input){
               self.session.addInput(input)
           }
       
           
       }
       catch{
           print(error.localizedDescription)
       }
   }
}

struct CameraPreview: UIViewRepresentable {
   
   @ObservedObject var camera : CameraModel
   
   func makeUIView(context: Context) -> UIView {
       
       let view = UIView(frame: UIScreen.main.bounds)
       
       camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
       camera.preview.frame = view.frame
       
       camera.preview.videoGravity = .resizeAspectFill
       view.layer.addSublayer(camera.preview)
     
       
       return view
   }
   
   func updateUIView(_ uiView: UIView, context: Context) {
       
   }
}

