//
//  ViewController.swift
//  VNPTeKYCSampleSwift
//
//  Created by Minh Nguyễn Minh on 24/05/2023.
//

import UIKit
import ICSdkEKYC


class ViewController: UIViewController {
    
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var buttonFullEkyc: UIButton!
    
    @IBOutlet weak var buttonOCR: UIButton!
    
    @IBOutlet weak var buttonFace: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.labelTitle.text = "Tích hợp SDK VNPT eKYC"
        
        self.buttonFullEkyc.setTitle("eKYC luồng đầy đủ", for: .normal)
        self.buttonFullEkyc.setTitleColor(UIColor.white, for: .normal)
        self.buttonFullEkyc.layer.cornerRadius = 6
        self.buttonFullEkyc.addTarget(self, action: #selector(self.actionFullEkyc), for: .touchUpInside)
        
        self.buttonOCR.setTitle("Thực hiện OCR giấy tờ", for: .normal)
        self.buttonOCR.setTitleColor(UIColor.white, for: .normal)
        self.buttonOCR.layer.cornerRadius = 6
        self.buttonOCR.addTarget(self, action: #selector(self.actionOCR), for: .touchUpInside)
        
        self.buttonFace.setTitle("Thực hiện kiểm tra khuôn mặt", for: .normal)
        self.buttonFace.setTitleColor(UIColor.white, for: .normal)
        self.buttonFace.layer.cornerRadius = 6
        self.buttonFace.addTarget(self, action: #selector(self.actionFace), for: .touchUpInside)
        
        // Nhập thông tin bộ mã truy cập. Lấy tại mục Quản lý Token https://ekyc.vnpt.vn/admin-dashboard/console/project-manager
//         ICEKYCSavedData.shared().tokenId = "2376daa5-1b7d-6728-e063-62199f0a66e9"
//         ICEKYCSavedData.shared().tokenKey = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALxXwliF4CxBl/tHC46es/XKfjdc44LMvqIOlp0jEjujjOr2jd/5QZ3gu058a/SD2HjBSG80dr1svlfZQ5Hb8NsCAwEAAQ=="
//         ICEKYCSavedData.shared().authorization = "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMzc2ZDdjYS1iNDBjLTAyY2MtZTA2My02MjE5OWYwYTA2YzMiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoic2lkZGhhbnQubWlzQGFzY2VuZGNvcnAuY29tIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJzaWRkaGFudC5taXNAYXNjZW5kY29ycC5jb20iLCJleHAiOjE3MzMxMzY4OTksInV1aWRfYWNjb3VudCI6IjIzNzZkN2NhLWI0MGMtMDJjYy1lMDYzLTYyMTk5ZjBhMDZjMyIsImF1dGhvcml0aWVzIjpbIlVTRVIiXSwianRpIjoiYjA1ZThiZTQtNTgxOS00YmZjLWE5ZmMtNWE3OWYzZDM1NmNkIiwiY2xpZW50X2lkIjoiOF9ob3VyIn0.4PJw-x_E1XMzrdu1pLE47fSOG8ByjUvWS2KTivFdz4Q9-Fpx8q6GT_wiKQd0nNUnhneMRyyy6QSQdSOE_HMEkJ8HRYj0idXyFoNKgXt7IenMvpTlE06oM6v_UOgv15R2t9s1v6HzDmFfvFjbZBRQGLwx2r-djxKq4MIb30icFeUCNGFHpqrgnefsWt56L28fkqi2gSjQJOpedYUglunkiIuTLA3UV8nMOmL56iKTEwIMPgsrv2mG_YPAfeDWtqFN1kO7moUnL2kxrKZ0ZIGTAHDWwj2pxbwEVEK4l01RgOiLfO7QkEI29IXxyXOCxqPgE6BJWMzLfCDQZW3sVFKPKg"

        // Hiển thị LOG các request được gọi trong SDK
        ICEKYCSavedData.shared().isPrintLogRequest = true
        
    }
    
    
    
    
    // MARK: - eKYC
    
    
    // Phương thức thực hiện eKYC luồng đầy đủ bao gồm: Chụp ảnh giấy tờ và chụp ảnh chân dung
    // Bước 1 - chụp ảnh giấy tờ
    // Bước 2 - chụp ảnh chân dung xa gần
    // Bước 3 - hiển thị kết quả
    @objc private func actionFullEkyc() {
        let objCamera = ICEkycCameraRouter.createModule() as! ICEkycCameraViewController
        objCamera.cameraDelegate = self
        
        objCamera.accessToken = "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMzc2ZDdjYS1iNDBjLTAyY2MtZTA2My02MjE5OWYwYTA2YzMiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoic2lkZGhhbnQubWlzQGFzY2VuZGNvcnAuY29tIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJzaWRkaGFudC5taXNAYXNjZW5kY29ycC5jb20iLCJleHAiOjE3MzMxMzY4OTksInV1aWRfYWNjb3VudCI6IjIzNzZkN2NhLWI0MGMtMDJjYy1lMDYzLTYyMTk5ZjBhMDZjMyIsImF1dGhvcml0aWVzIjpbIlVTRVIiXSwianRpIjoiYjA1ZThiZTQtNTgxOS00YmZjLWE5ZmMtNWE3OWYzZDM1NmNkIiwiY2xpZW50X2lkIjoiOF9ob3VyIn0.4PJw-x_E1XMzrdu1pLE47fSOG8ByjUvWS2KTivFdz4Q9-Fpx8q6GT_wiKQd0nNUnhneMRyyy6QSQdSOE_HMEkJ8HRYj0idXyFoNKgXt7IenMvpTlE06oM6v_UOgv15R2t9s1v6HzDmFfvFjbZBRQGLwx2r-djxKq4MIb30icFeUCNGFHpqrgnefsWt56L28fkqi2gSjQJOpedYUglunkiIuTLA3UV8nMOmL56iKTEwIMPgsrv2mG_YPAfeDWtqFN1kO7moUnL2kxrKZ0ZIGTAHDWwj2pxbwEVEK4l01RgOiLfO7QkEI29IXxyXOCxqPgE6BJWMzLfCDQZW3sVFKPKg"
        objCamera.tokenId = "2376daa5-1b7d-6728-e063-62199f0a66e9"
        objCamera.tokenKey = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALxXwliF4CxBl/tHC46es/XKfjdc44LMvqIOlp0jEjujjOr2jd/5QZ3gu058a/SD2HjBSG80dr1svlfZQ5Hb8NsCAwEAAQ=="

        // Giá trị này xác định phiên bản khi sử dụng Máy ảnh tại bước chụp ảnh chân dung luồng full. Mặc định là Normal ✓
        // - Normal: chụp ảnh chân dung 1 hướng
        // - ProOval: chụp ảnh chân dung xa gần
        objCamera.versionSdk = ProOval
        
        // Giá trị xác định luồng thực hiện eKYC
        // - full: thực hiện eKYC đầy đủ các bước: chụp mặt trước, chụp mặt sau và chụp ảnh chân dung
        // - ocrFront: thực hiện OCR giấy tờ một bước: chụp mặt trước
        // - ocrBack: thực hiện OCR giấy tờ một bước: chụp mặt trước
        // - ocr: thực hiện OCR giấy tờ đầy đủ các bước: chụp mặt trước, chụp mặt sau
        // - face: thực hiện so sánh khuôn mặt với mã ảnh chân dung được truyền từ bên ngoài
        objCamera.flowType = full
        
        // Giá trị này xác định kiểu giấy tờ để sử dụng:
        // - IdentityCard: Chứng minh thư nhân dân, Căn cước công dân
        // - IDCardChipBased: Căn cước công dân gắn Chip
        // - Passport: Hộ chiếu
        // - DriverLicense: Bằng lái xe
        // - MilitaryIdCard: Chứng minh thư quân đội
        objCamera.documentType = IdentityCard
        
        // Giá trị này dùng để đảm bảo mỗi yêu cầu (request) từ phía khách hàng sẽ không bị thay đổi.
        objCamera.challengeCode = "INNOVATIONCENTER"
        
        // Bật/Tắt Hiển thị màn hình hướng dẫn
        objCamera.isShowTutorial = true
        
        // Bật/Tắt chức năng So sánh ảnh trong thẻ và ảnh chân dung
        objCamera.isEnableCompare = true
        
        // Bật/Tắt chức năng kiểm tra che mặt
        objCamera.isCheckMaskedFace = true
        
        // Lựa chọn chức năng kiểm tra ảnh chân dung chụp trực tiếp (liveness face)
        // - NoneCheckFace: Không thực hiện kiểm tra ảnh chân dung chụp trực tiếp hay không
        // - IBeta: Kiểm tra ảnh chân dung chụp trực tiếp hay không iBeta (phiên bản hiện tại)
        // - Standard: Kiểm tra ảnh chân dung chụp trực tiếp hay không Standard (phiên bản mới)
        objCamera.checkLivenessFace = IBeta
        
        // Bật/Tắt chức năng kiểm tra ảnh giấy tờ chụp trực tiếp (liveness card)
        objCamera.isCheckLivenessCard = true
        
        // Lựa chọn chế độ kiểm tra ảnh giấy tờ ngay từ SDK
        // - None: Không thực hiện kiểm tra ảnh khi chụp ảnh giấy tờ
        // - Basic: Kiểm tra sau khi chụp ảnh
        // - MediumFlip: Kiểm tra ảnh hợp lệ trước khi chụp (lật giấy tờ thành công → hiển thị nút chụp)
        // - Advance: Kiểm tra ảnh hợp lệ trước khi chụp (hiển thị nút chụp)
        objCamera.validateDocumentType = Basic
        
        // Bật chức năng hiển thị nút bấm "Bỏ qua hướng dẫn" tại các màn hình hướng dẫn bằng video
        objCamera.isEnableGotIt = true
        
        // Ngôn ngữ sử dụng trong SDK
        objCamera.languageSdk = "icekyc_vi"
        
        // Bật/Tắt Hiển thị ảnh thương hiệu
        // objCamera.isShowTrademark = true
        
        objCamera.modalPresentationStyle = .fullScreen
        objCamera.modalTransitionStyle = .coverVertical
        self.present(objCamera, animated: true, completion: nil)
    }
    
    
    // Phương thức thực hiện eKYC luồng "Chụp ảnh giấy tờ"
    // Bước 1 - chụp ảnh giấy tờ
    // Bước 2 - hiển thị kết quả
    @objc private func actionOCR() {
        let objCamera = ICEkycCameraRouter.createModule() as! ICEkycCameraViewController
        objCamera.cameraDelegate = self
        
        // Giá trị xác định luồng thực hiện eKYC
        // - full: thực hiện eKYC đầy đủ các bước: chụp mặt trước, chụp mặt sau và chụp ảnh chân dung
        // - ocrFront: thực hiện OCR giấy tờ một bước: chụp mặt trước
        // - ocrBack: thực hiện OCR giấy tờ một bước: chụp mặt trước
        // - ocr: thực hiện OCR giấy tờ đầy đủ các bước: chụp mặt trước, chụp mặt sau
        // - face: thực hiện so sánh khuôn mặt với mã ảnh chân dung được truyền từ bên ngoài
        objCamera.flowType = ocr
        
        objCamera.accessToken = "bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMzc2ZDdjYS1iNDBjLTAyY2MtZTA2My02MjE5OWYwYTA2YzMiLCJhdWQiOlsicmVzdHNlcnZpY2UiXSwidXNlcl9uYW1lIjoic2lkZGhhbnQubWlzQGFzY2VuZGNvcnAuY29tIiwic2NvcGUiOlsicmVhZCJdLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdCIsIm5hbWUiOiJzaWRkaGFudC5taXNAYXNjZW5kY29ycC5jb20iLCJleHAiOjE3MzMxMzY4OTksInV1aWRfYWNjb3VudCI6IjIzNzZkN2NhLWI0MGMtMDJjYy1lMDYzLTYyMTk5ZjBhMDZjMyIsImF1dGhvcml0aWVzIjpbIlVTRVIiXSwianRpIjoiYjA1ZThiZTQtNTgxOS00YmZjLWE5ZmMtNWE3OWYzZDM1NmNkIiwiY2xpZW50X2lkIjoiOF9ob3VyIn0.4PJw-x_E1XMzrdu1pLE47fSOG8ByjUvWS2KTivFdz4Q9-Fpx8q6GT_wiKQd0nNUnhneMRyyy6QSQdSOE_HMEkJ8HRYj0idXyFoNKgXt7IenMvpTlE06oM6v_UOgv15R2t9s1v6HzDmFfvFjbZBRQGLwx2r-djxKq4MIb30icFeUCNGFHpqrgnefsWt56L28fkqi2gSjQJOpedYUglunkiIuTLA3UV8nMOmL56iKTEwIMPgsrv2mG_YPAfeDWtqFN1kO7moUnL2kxrKZ0ZIGTAHDWwj2pxbwEVEK4l01RgOiLfO7QkEI29IXxyXOCxqPgE6BJWMzLfCDQZW3sVFKPKg"
        objCamera.tokenId = "2376daa5-1b7d-6728-e063-62199f0a66e9"
        objCamera.tokenKey = "MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBALxXwliF4CxBl/tHC46es/XKfjdc44LMvqIOlp0jEjujjOr2jd/5QZ3gu058a/SD2HjBSG80dr1svlfZQ5Hb8NsCAwEAAQ=="
        
        // Giá trị này xác định kiểu giấy tờ để sử dụng:
        // - IdentityCard: Chứng minh thư nhân dân, Căn cước công dân
        // - IDCardChipBased: Căn cước công dân gắn Chip
        // - Passport: Hộ chiếu
        // - DriverLicense: Bằng lái xe
        // - MilitaryIdCard: Chứng minh thư quân đội
        objCamera.documentType = IdentityCard
        
        // Giá trị này dùng để đảm bảo mỗi yêu cầu (request) từ phía khách hàng sẽ không bị thay đổi.
        objCamera.challengeCode = "INNOVATIONCENTER"
        
        // Bật/Tắt Hiển thị màn hình hướng dẫn
        objCamera.isShowTutorial = true
        
        // Bật/Tắt chức năng kiểm tra ảnh giấy tờ chụp trực tiếp (liveness card)
        objCamera.isCheckLivenessCard = true
        
        // Lựa chọn chế độ kiểm tra ảnh giấy tờ ngay từ SDK
        // - None: Không thực hiện kiểm tra ảnh khi chụp ảnh giấy tờ
        // - Basic: Kiểm tra sau khi chụp ảnh
        // - MediumFlip: Kiểm tra ảnh hợp lệ trước khi chụp (lật giấy tờ thành công → hiển thị nút chụp)
        // - Advance: Kiểm tra ảnh hợp lệ trước khi chụp (hiển thị nút chụp)
        objCamera.validateDocumentType = Basic
        
        // Ngôn ngữ sử dụng trong SDK
        objCamera.languageSdk = "icekyc_vi"
        
//         objCamera.changeBaseUrl = "https://sandbox-idg.vnpt.vn"
        
        // Bật/Tắt Hiển thị ảnh thương hiệu
        // objCamera.isShowTrademark = true
        
        objCamera.modalPresentationStyle = .fullScreen
        objCamera.modalTransitionStyle = .coverVertical
        self.present(objCamera, animated: true, completion: nil)
    }
    
    
    // Phương thức thực hiện eKYC luồng đầy đủ bao gồm: Chụp ảnh giấy tờ và chụp ảnh chân dung
    // Bước 1 - chụp ảnh chân dung xa gần
    // Bước 2 - hiển thị kết quả
    @objc private func actionFace() {
        let objCamera = ICEkycCameraRouter.createModule() as! ICEkycCameraViewController
        objCamera.cameraDelegate = self
        
        // Giá trị này xác định phiên bản khi sử dụng Máy ảnh tại bước chụp ảnh chân dung luồng full. Mặc định là Normal ✓
        // - Normal: chụp ảnh chân dung 1 hướng
        // - ProOval: chụp ảnh chân dung xa gần
        objCamera.versionSdk = ProOval
        
        // Giá trị xác định luồng thực hiện eKYC
        // - full: thực hiện eKYC đầy đủ các bước: chụp mặt trước, chụp mặt sau và chụp ảnh chân dung
        // - ocrFront: thực hiện OCR giấy tờ một bước: chụp mặt trước
        // - ocrBack: thực hiện OCR giấy tờ một bước: chụp mặt trước
        // - ocr: thực hiện OCR giấy tờ đầy đủ các bước: chụp mặt trước, chụp mặt sau
        // - face: thực hiện so sánh khuôn mặt với mã ảnh chân dung được truyền từ bên ngoài
        objCamera.flowType = face
        
        // Giá trị này dùng để đảm bảo mỗi yêu cầu (request) từ phía khách hàng sẽ không bị thay đổi.
        objCamera.challengeCode = "INNOVATIONCENTER"
        
        // Bật/Tắt Hiển thị màn hình hướng dẫn
        objCamera.isShowTutorial = true
        
        // Bật/[Tắt] chức năng So sánh ảnh trong thẻ và ảnh chân dung
        objCamera.isEnableCompare = false
        
        // Bật/Tắt chức năng kiểm tra che mặt
        objCamera.isCheckMaskedFace = true
        
        // Lựa chọn chức năng kiểm tra ảnh chân dung chụp trực tiếp (liveness face)
        // - NoneCheckFace: Không thực hiện kiểm tra ảnh chân dung chụp trực tiếp hay không
        // - IBeta: Kiểm tra ảnh chân dung chụp trực tiếp hay không iBeta (phiên bản hiện tại)
        // - Standard: Kiểm tra ảnh chân dung chụp trực tiếp hay không Standard (phiên bản mới)
        objCamera.checkLivenessFace = IBeta
        
        // Bật chức năng hiển thị nút bấm "Bỏ qua hướng dẫn" tại các màn hình hướng dẫn bằng video
        objCamera.isEnableGotIt = false
        
        
        // Ngôn ngữ sử dụng trong SDK
        objCamera.languageSdk = "icekyc_vi"
        
        // Bật/Tắt Hiển thị ảnh thương hiệu
        // objCamera.isShowTrademark = true
        
        objCamera.modalPresentationStyle = .fullScreen
        objCamera.modalTransitionStyle = .coverVertical
        self.present(objCamera, animated: true, completion: nil)
    }
}



// MARK: - ICEkycCameraDelegate
extension ViewController: ICEkycCameraDelegate {
    
    // Phương thức trả về kết quả sau khi thực hiện eKYC
    func icEkycGetResult() {
        
        // Thông tin bóc tách OCR
        let ocrResult = ICEKYCSavedData.shared().ocrResult
        // Kết quả kiểm tra giấy tờ chụp trực tiếp (Liveness Card) mặt trước
        let livenessCardFrontResult = ICEKYCSavedData.shared().livenessCardFrontResult
        // Kết quả kiểm tra giấy tờ chụp trực tiếp (Liveness Card) mặt sau
        let livenessCardBackResult = ICEKYCSavedData.shared().livenessCardBackResult
        
        // Dữ liệu thực hiện SO SÁNH khuôn mặt (lấy từ mặt trước ảnh giấy tờ hoặc ảnh thẻ)
        let compareFaceResult = ICEKYCSavedData.shared().compareFaceResult
        
        // Dữ liệu kiểm tra ảnh CHÂN DUNG chụp trực tiếp hay không
        let livenessFaceResult = ICEKYCSavedData.shared().livenessFaceResult
        
        // Dữ liệu XÁC THỰC ảnh CHÂN DUNG và SỐ GIẤY TỜ
        let verifyFaceResult = ICEKYCSavedData.shared().verifyFaceResult
        
        // Dữ liệu kiểm tra ảnh CHÂN DUNG có bị che mặt hay không
        let maskedFaceResult = ICEKYCSavedData.shared().maskedFaceResult
        
        /*
        // Ảnh [chụp giấy tờ mặt trước] đã cắt được trả ra để ứng dụng hiển thị
        let imageFrontCroped = ICEKYCSavedData.shared().imageCropedFront
        
        // Mã ảnh giấy tờ mặt trước sau khi tải lên máy chủ
        let hashImageFront = ICEKYCSavedData.shared().hashImageFront
        
        // Đường dẫn Ảnh đầy đủ khi chụp giấy tờ mặt trước
        let pathImageFront = ICEKYCSavedData.shared().pathImageFront
        print("pathImageFront = \(pathImageFront.path)")
        
        // Đường dẫn Ảnh [chụp giấy tờ mặt trước] đã cắt được trả ra để ứng dụng hiển thị
        let pathImageCropedFront = ICEKYCSavedData.shared().pathImageCropedFront
        print("pathImageCropedFront = \(pathImageCropedFront.path)")
        
        
        // Ảnh [chụp giấy tờ mặt sau] đã cắt được trả ra để ứng dụng hiển thị
        let imageBackCroped = ICEKYCSavedData.shared().imageCropedBack
        
        // Mã ảnh giấy tờ mặt sau sau khi tải lên máy chủ
        let hashImageBack = ICEKYCSavedData.shared().hashImageBack
        
        // Đường dẫn Ảnh đầy đủ khi chụp giấy tờ mặt sau
        let pathImageBack = ICEKYCSavedData.shared().pathImageBack
        print("pathImageBack = \(pathImageBack.path)")
        
        // Đường dẫn Ảnh [chụp giấy tờ mặt sau] đã cắt được trả ra để ứng dụng hiển thị
        let pathImageCropedBack = ICEKYCSavedData.shared().pathImageCropedBack
        print("pathImageCropedBack = \(pathImageCropedBack.path)")
        
        
        // Ảnh chân dung chụp xa đã cắt được trả ra để ứng dụng hiển thị
        let imageFaceFarCroped = ICEKYCSavedData.shared().imageCropedFaceFar
        // Mã ảnh chân dung chụp xa sau khi tải lên máy chủ
        let hashImageFaceFar = ICEKYCSavedData.shared().hashImageFar
        
        // Ảnh chân dung chụp gần đã cắt được trả ra để ứng dụng hiển thị
        let imageFaceNearCroped = ICEKYCSavedData.shared().imageCropedFaceNear
        // Mã ảnh chân dung chụp gần sau khi tải lên máy chủ
        let hashImageFaceNear = ICEKYCSavedData.shared().hashImageNear
        
        // Dữ liệu để xác định cách giao dịch (yêu cầu) cùng nằm trong cùng một phiên
        let clientSessionResult = ICEKYCSavedData.shared().clientSessionResult
        */
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let viewShowResult = storyboard.instantiateViewController(withIdentifier: "ResultEkyc") as! ResultEkycViewController
            
            // Thông tin Giấy tờ
            viewShowResult.ocrResult = ocrResult
            viewShowResult.livenessCardFrontResult = livenessCardFrontResult
            viewShowResult.livenessCardBackResult = livenessCardBackResult
            
            // Thông tin khuôn mặt
            viewShowResult.compareFaceResult = compareFaceResult
            viewShowResult.livenessFaceResult = livenessFaceResult
            viewShowResult.verifyFaceResult = verifyFaceResult
            viewShowResult.maskedFaceResult = maskedFaceResult
            
            /*
            // Ảnh giấy tờ Mặt trước
            viewShowResult.imageFrontCroped = imageFrontCroped
            viewShowResult.hashImageFront = hashImageFront
            
            // Ảnh giấy tờ Mặt sau
            viewShowResult.imageBackCroped = imageBackCroped
            viewShowResult.hashImageBack = hashImageBack
            
            // Ảnh chân dung xa
            viewShowResult.imageFaceFarCroped = imageFaceFarCroped
            viewShowResult.hashImageFaceFar = hashImageFaceFar
            
            // Ảnh chân dung gần
            viewShowResult.imageFaceNearCroped = imageFaceNearCroped
            viewShowResult.hashImageFaceNear = hashImageFaceNear
            
            viewShowResult.clientSession = clientSessionResult
            */
            let navigationController = UINavigationController(rootViewController: viewShowResult)
            navigationController.modalPresentationStyle = .fullScreen
            navigationController.modalTransitionStyle = .coverVertical
            self.present(navigationController, animated: true, completion: nil)
        }
    }
    
}
