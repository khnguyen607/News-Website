-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 18, 2023 lúc 05:20 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `papr`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `author`
--

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `user` varchar(100) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `role` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `author`
--

INSERT INTO `author` (`id`, `name`, `email`, `user`, `pass`, `status`, `role`) VALUES
(0, 'QUẢN TRỊ VIÊN', '', 'admin', '$2y$10$vnb8PdkfV9Sb439eCxsc.eAns8VxqoXw5dmM45/Dg9tpTi3tOwHTe', 1, 1),
(1, 'Tác giả 1', 'author1@gmail.com', 'author1', '', 1, 0),
(2, 'Tác giả 2', 'author2@gmail.com', 'author2', '', 1, 0),
(3, 'Minh', 'minh@gmail.com', 'minh', '$2y$10$IpjzOryb8/1gKDYpKpmNnOhXS9gj7HvyWNQvo.tLtcEx8B2m7sihy', 1, 0),
(4, 'Giang', 'giang@gmail.com', 'giang', '$2y$10$lx2bDKE1qye1HbbhlSfhruvu63kGWjkj3JgjYuOOBy2h2fxBK27A6', 1, 0),
(6, 'Kiên', 'kien@gmail.com', 'kien', '$2y$10$TxF2GnitkH923tB3lF4/ZOt/tWmrItbDeASl0F3R3G.srLsh3AKPi', 1, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `name`, `status`) VALUES
(1, 'Thời sự', 1),
(2, 'Thế giới', 1),
(3, 'Kinh tế', 1),
(4, 'Xã hội', 1),
(5, 'Pháp luật', 1),
(6, 'Văn hóa', 1),
(7, 'Giáo dục', 0),
(8, 'Thể thao', 0),
(10, 'Bóng đá', 0),
(11, 'Bóng đá', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `user_id` int(11) NOT NULL,
  `new_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `new_id`, `date`, `status`) VALUES
(1, 'Hay', 2, 20, '2023-12-17', 1),
(2, 'Thế à', 3, 19, '2023-12-17', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(500) NOT NULL,
  `content` varchar(5000) NOT NULL,
  `img` varchar(500) NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `views` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `img`, `author_id`, `category_id`, `date`, `views`, `status`) VALUES
(19, 'Chủ tịch nước Võ Văn Thưởng chúc mừng Giáng sinh Tổng Giáo phận Huế', '<h2 class=\"sapo\">\r\n                Nhân dịp mùa Giáng sinh 2023 và chuẩn bị đón năm mới 2024, sáng 14/12, Chủ tịch nước Võ Văn Thưởng thay mặt lãnh đạo Đảng, Nhà nước đến thăm, tặng quà, chúc mừng Tổng Giáo phận Huế. \r\n            </h2>', 'https://cdnmedia.baotintuc.vn/Upload/OOs7T2PPeyDFX8lb8ayig/files/thuong-141203.jpg', 3, 1, '2023-12-14', 2, 1),
(20, 'Thường vụ Quốc hội đánh giá kết quả thực hiện chương trình hoạt động đối ngoại, hợp tác quốc tế năm 2023', '<p>Tiếp tục Phiên họp thứ 28, sáng 14/12, tại Nhà Quốc hội, Ủy ban Thường vụ Quốc hội đánh giá kết quả thực hiện chương trình hoạt động đối ngoại, hợp tác quốc tế năm 2023; xem xét, thông qua chương trình hoạt động đối ngoại năm 2024 của Ủy ban Thường vụ Quốc hội và cho ý kiến, về chương trình đối ngoại, hợp tác quốc tế của Hội đồng Dân tộc, các Ủy ban của Quốc hội...</p>', 'https://cdnmedia.baotintuc.vn/Upload/3qVxwVtNEPp6Wp9kkF77g/files/2023/12/14/ubtvqh-141223-1.jpg', 2, 1, '2023-12-14', 5, 1),
(21, 'Phát biểu của Tổng Bí thư, Chủ tịch nước Trung Quốc Tập Cận Bình tại Cuộc gặp gỡ nhân sĩ hữu nghị và thế hệ trẻ hai nước', '\"<p><em>Kính thưa đồng chí Tổng Bí thư Nguyễn Phú Trọng và Phu nhân Ngô Thị Mận,<br>\r\n<br>\r\nThưa các đồng chí và các bạn thanh niên của hai nước Trung - Việt,</em><br>\r\n<br>\r\nXin chào mọi người, rất vui được gặp gỡ với các bạn sau 6 năm tôi thăm lại đất nước Việt Nam tươi đẹp. Khi nhìn thấy các khuôn mặt tràn đầy nhiệt tình của các bạn, tôi cảm thấy đặc biệt vui mừng.<br>\r\n<br>\r\nCó mặt tại cuộc gặp hôm nay, có nhiều người bạn cũ đã cống hiến lâu năm cho tình hữu nghị Trung - Việt, cũng có các bạn mới trẻ trung, tôi xin thay mặt Đảng, Nhà nước Trung Quốc gửi lời chào thân tình tới các bạn.<br>\r\n<br>\r\nHôm qua, tôi và đồng chí Tổng Bí thư Nguyễn Phú Trọng đã cùng tuyên bố xây dựng Cộng đồng chia sẻ tương lai Trung Quốc - Việt Nam có ý nghĩa chiến lược, mở ra giai đoạn mới phát triển quan hệ hai Đảng, hai nước Trung - Việt.<br>\r\n<br>\r\nNhìn lại quá khứ, chúng ta cùng chung chí hướng, ủng hộ lẫn nhau. Hai Đảng Trung Quốc - Việt Nam và nhân dân hai nước kiên định, kiên trì lý tưởng tín nhiệm chung trong tiến trình sự nghiệp đấu tranh giành độc lập cho dân tộc, hai nước chúng ta cùng ủng hộ, giúp đỡ lẫn nhau.<br>\r\n<br>\r\nChủ tịch Hồ Chí Minh từng hoạt động cách mạng ở Trung Quốc 12 năm và lần lượt sáng lập Việt Nam thanh niên cách mạng đồng chí hội ở Quảng Châu và thành lập Đảng Cộng sản Việt Nam ở Hong Kong. Người còn chỉ đạo cách mạng Việt Nam ở Vân Nam, Quảng Tây trong một quãng thời gian dài. Có một nông dân ở huyện Long Châu, khu tự trị Quảng Tây tên là Nông Kỳ Chấn từng liều mạng mình để che chở cho Chủ tịch Hồ Chí Minh, bảo vệ an toàn cho Chủ tịch Hồ Chí Minh. Chủ tịch Hồ Chí Minh đã từng viết thư kính báo đồng bào Việt Nam ở Quảng Tây. Và năm 1945, Người từ Quảng Tây về Việt Nam lãnh đạo Cách mạng tháng Tám thắng lợi và thành lập ra nước Việt Nam Dân chủ Cộng hòa.<br>\r\n<br>\r\nTrong các cuộc đấu tranh chống Pháp, chống Mỹ cứu nước của Việt Nam, hơn 1.400 liệt sĩ Trung Quốc đã hy sinh anh dũng, yên nghỉ trên mảnh đất Việt Nam. Bệnh viện ở Quế Lâm, Quảng Tây đã từng chữa trị cho hơn 5.000 thương binh Việt Nam. Dục tài học hiệu đã đào tạo hơn 10.000 học sinh cho Việt Nam. Việt Nam cũng tích cực ủng hộ cách mạng Trung Quốc. Tướng Nguyễn Sơn của Việt Nam đã dấn thân vào cuộc khởi nghĩa ở Quảng Châu và tham gia vào cuộc trường chinh hồng quân của Trung Quốc, là “lưỡng quốc tướng quân” lừng danh.</p>\"', 'https://cdnmedia.baotintuc.vn/Upload/rGkvwNpj74Z1EcpzQ6ltA/files/2023/12/tuan4/nhan-sy1-131223.jpg', 3, 1, '2023-12-14', 1, 1),
(22, 'Armenia và Azerbaijan trao đổi tù binh', '\"<div id=\"\"divfirst\"\"><div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" height=\"\"406\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/OOs7T2PPeyDFX8lb8ayig/files/Azerbaijan-140922.jpg\"\" width=\"\"665\"\">\r\n<figcaption>Binh sĩ Azerbaijan tuần tra tại trạm kiểm soát ở thị trấn Shusha, sau cuộc xung đột với binh sĩ Armenia tại khu vực tranh chấp Nagorno-Karabakh. Ảnh tư liệu: AFP/TTXVN</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Ủy ban nhà nước phụ trách vấn đề tù nhân chiến tranh của Azerbaijan cho biết nước này đã thả tự do cho 32 quân nhân Armenia và Armenia cũng đã thả tự do cho 2 quân nhân Azerbaijan. Hoạt động trao đổi diễn ra tại khu vực Gazakh biên giới giữa hai nước. &nbsp;</p>\r\n\r\n<p>Trong khi đó, trên mạng xã hội Facebook, Thủ tướng Armenia Nikol Pashinyan đã công bố danh sách 32 quân nhân được trả tự do của nước này.&nbsp;</p>\r\n\r\n<p>Tuần trước, Armenia và Azerbaijan đã ra tuyên bố chung cam kết nắm bắt \"\"cơ hội lịch sử để đạt được hòa bình được chờ đợi từ lâu ở khu vực\"\" và thông báo trao đổi tù binh. Liên minh châu Âu (EU), Mỹ, cùng các nước khác trong khu vực như Thổ Nhĩ Kỳ và Nga đã hoan nghênh tuyên bố này là \"\"bước đột phá\"\".&nbsp;</p>\r\n\r\n</div>\"', 'https://cdnmedia.baotintuc.vn/Upload/OOs7T2PPeyDFX8lb8ayig/files/Azerbaijan-140922.jpg', 4, 2, '2023-12-14', 4, 1),
(23, '\"Cần thiết ban hành pháp lệnh về chi phí tố tụng\r\n\"', '\"<div id=\"\"divfirst\"\"><div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/xWDHf0fP0gRVbF1yzOohA/files/2023/12/phochanhan.jpeg\"\">\r\n<figcaption>Phó Chánh án Toà án Nhân dân tối cao Nguyễn Văn Tiến trình bày Tờ trình Pháp lệnh Chi phí tố tụng.</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p><strong>Tạo cơ sở pháp lý đồng bộ&nbsp;</strong></p>\r\n\r\n<p>Trình bày Tờ trình Pháp lệnh Chi phí tố tụng, Phó Chánh án Toà án nhân dân tối cao Nguyễn Văn Tiến nhấn mạnh sự cần thiết ban hành Pháp lệnh Chi phí tố tụng. Nêu rõ thực trạng pháp luật về chi phí tố tụng, Phó Chánh án Toà án nhân dân tối cao Nguyễn Văn Tiến cho biết, Pháp lệnh số 02/2012/UBTVQH13 được ban hành để cụ thể hóa Bộ luật Tố tụng dân sự năm 2004, Bộ luật Tố tụng hình sự năm 2003, Luật Tố tụng hành chính năm 2010,&nbsp;nên một số quy định của Pháp lệnh này chưa đồng bộ, thống nhất với quy định của pháp luật hiện hành; một số quy định chưa chi tiết, không còn phù hợp với điều kiện kinh tế, xã hội hiện nay .</p>\r\n\r\n<p>Đối với chi phí xem xét, thẩm định tại chỗ trong tố tụng dân sự, tố tụng hành chính; chi phí cho người chứng kiến, người dịch thuật trong tố tụng hình sự hiện nay chưa có văn bản quy định chi tiết. Đối với chi phí cho người bào chữa trong trường hợp chỉ định người bào chữa,&nbsp;pháp luật hiện hành chỉ quy định riêng cho đối tượng là luật sư, trợ giúp viên pháp lý,&nbsp;chưa có quy định cho bào chữa viên nhân dân.</p>\r\n\r\n<p>Bên cạnh đó, thực tiễn áp dụng pháp luật về chi phí tố tụng đang gặp một số khó khăn, vướng mắc như: Mức chi cho Hội thẩm còn thấp, không khuyến khích được Hội thẩm tham gia thực hiện nhiệm vụ xét xử. Việc tính tiền tạm ứng, trình tự, thủ tục thu, mức thu, mức chi chi phí xem xét, thẩm định tại chỗ còn chưa thống nhất; một số chi phí phát sinh trong hoạt động giám định chưa được pháp luật điều chỉnh…</p>\r\n\r\n<p>Do đó, Phó Chánh án Toà án nhân dân tối cao Nguyễn Văn Tiến khẳng định, việc xây dựng, ban hành Pháp lệnh Chi phí tố tụng là&nbsp;cần thiết.</p>\r\n\r\n<p>Phó Chánh án Toà án nhân dân tối cao Nguyễn Văn Tiến cho biết, dự thảo Pháp lệnh gồm 92 điều, 13 chương. Về phạm vi điều chỉnh của dự thảo Pháp lệnh, Dự thảo Pháp lệnh quy định các chi phí tố tụng trong tố tụng dân sự, tố tụng hành chính, tố tụng hình sự và trong thủ tục xem xét, quyết định việc đưa người nghiện ma túy từ đủ 12 tuổi đến dưới 18 tuổi vào cơ sở cai nghiện bắt buộc; áp dụng các biện pháp xử lý hành chính quy định tại Bộ luật Tố tụng hình sự, Bộ luật Tố tụng dân sự, Luật Tố tụng hành chính, Pháp lệnh số 01/2022/UBTVQH15, Pháp lệnh số 03/2022/UBTVQH15.</p>\r\n\r\n<p>Về việc miễn, giảm chi phí xem xét, thẩm định tại chỗ, giám định, dự thảo Pháp lệnh về cơ bản kế thừa quy định về miễn, giảm chi phí giám định của Pháp lệnh số 02/2012/UBTVQH13, đồng thời bổ sung việc miễn, giảm chi phí xem xét, thẩm định tại chỗ tương tự như đối với chi phí giám định; bổ sung một số đối tượng được miễn (người cao tuổi; người khuyết tật; người có công với cách mạng;…); sửa đổi trường hợp được giảm là người gặp sự kiện bất khả kháng dẫn đến không có đủ tài sản để nộp. Việc bổ sung các quy định này đã thể hiện chính sách nhân văn của Nhà nước, bảo đảm quyền khởi kiện của chủ thể tham gia tố tụng.</p>\r\n\r\n<p>Về chi phí tố tụng cụ thể, dự thảo Pháp lệnh quy định chi phí xem xét, thẩm định tại chỗ, chi phí định giá tài sản, chi phí giám định, chi phí cho Hội thẩm, chi phí cho luật sư, trợ giúp viên pháp lý, bào chữa viên nhân dân trong trường hợp chỉ định người bào chữa, người đại diện do Tòa án chỉ định, chi phí cho người làm chứng, người chứng kiến, chi phí cho người phiên dịch, người dịch thuật, chi phí cấp, tống đạt, thông báo văn bản tố tụng, chi phí ủy thác tư pháp ra nước ngoài và chi phí tố tụng khác.</p>\r\n\r\n<p>Nội dung dự thảo Pháp lệnh đảm bảo phù hợp với quan điểm, chủ trương, đường lối của Đảng, chính sách của Nhà nước về xây dựng nhà nước pháp quyền xã hội chủ nghĩa, cải cách tư pháp, cải cách chính sách tiền lương.</p>\r\n\r\n<p>Bên cạnh đó, Phó Chánh án Toà án nhân dân tối cao &nbsp;Nguyễn Văn Tiến báo cáo UBTVQH về một số vấn đề còn ý kiến khác nhau như về phụ cấp xét xử cho Hội thẩm, về chi phí thù lao cho người hưởng lương từ ngân sách Nhà nước tham gia hoạt động tố tụng.</p>\r\n\r\n<p><strong>Đảm bảo tính khả thi và tính đồng bộ của hệ thống pháp luật</strong></p>\r\n\r\n<p>Thay mặt cơ quan thẩm tra dự án Pháp lệnh Chi phí tố tụng, Chủ nhiệm Ủy ban Tư pháp Lê Thị Nga khẳng định: Ủy ban Tư pháp nhất trí với sự cần thiết ban hành Pháp lệnh Chi phí tố tụng với những lý do như đã nêu trong Tờ trình của Toà án nhân dân tối cao, nhằm thực hiện quy định tại Điều 169 Bộ luật Tố tụng dân sự (TTDS), Điều 370 Luật Tố tụng hành chính (TTHC) và tháo gỡ những khó khăn trong thực tiễn thi hành Bộ luật Tố tụng hình sự (TTHS) về chi phí tố tụng, góp phần quan trọng bảo đảm các điều kiện để hoạt động tố tụng được tiến hành kịp thời và hiệu quả.</p>\r\n\r\n<p>Về phạm vi điều chỉnh của Pháp lệnh (Điều 1): Đa số', 'https://cdnmedia.baotintuc.vn/Upload/xWDHf0fP0gRVbF1yzOohA/files/2023/12/phochanhan.jpeg', 2, 1, '2023-12-14', 9, 1),
(24, 'Năm vấn đề lưu ý trong Nghị định thư đối với quả dưa hấu tươi xuất khẩu sang Trung Quốc', '\"<div id=\"\"divend\"\"><p>Theo ông Ngô Xuân Nam, một là Nghị định thư đã xác định rõ các yêu cầu về nhập khẩu để nhằm đảm bảo quả dưa hấu tươi của Việt Nam tuân thủ các luật cũng như quy định và các tiêu chuẩn liên quan đến vấn đề an toàn vệ sinh thực phẩm và yêu cầu kiểm dịch thực vật của Trung Quốc. Từ đó, các vùng trồng cũng như các cơ sở đóng gói của Việt Nam phải tuân thủ các quy định này.<br>\r\n<br>\r\n“Như vậy phải lưu ý ở điểm này có hai vấn đề phải quan tâm là vệ sinh an toàn thực phẩm và đối tượng kiểm dịch”, ông Ngô Xuân Nam nhấn mạnh.<br>\r\n<br>\r\nNội dung thứ hai cần quan tâm là quả dưa hấu tươi của Việt Nam khi xuất khẩu sang Trung Quốc thì không được nhiễm năm đối tượng kiểm dịch thực vật còn sống mà Trung Quốc quan tâm bao gồm: ba loài ruồi đục quả, một loài rệp và một vi khuẩn.<br>\r\n<br>\r\nKhi xuất khẩu dưa hấu tươi vào thị trường Trung Quốc thì sản phẩm không được phép nhiễm các đối tượng kiểm dịch này. Nếu sản phẩm bị nhiễm một trong năm đối tượng trên sẽ vi phạm quy định của thị trường Trung Quốc.<br>\r\n<br>\r\nNội dung thứ ba cần quan tâm là tất cả các vùng trồng, các cơ sở đóng gói dưa hấu tươi xuất khẩu sang Trung Quốc phải được đăng ký và được cả Bộ Nông nghiệp Phát triển nông thôn và Tổng cục Hải quan Trung Quốc cấp mã. Vườn trồng phải áp dụng thực hành nông nghiệp tốt (GAP) và phải đảm bảo giám sát vườn trồng, giám sát quy trình đóng gói.<br>\r\n<br>\r\nNội dung thứ tư là cơ sở đóng gói phải xây dựng được hệ thống truy xuất nguồn gốc để đảm bảo quả dưa hấu tươi xuất sang Trung Quốc là có thể truy xuất được đến vùng trồng đã được cấp mã số. Như vậy, chúng ta phải có sổ hồ sơ, sổ sách ghi chép rõ ràng để phục vụ việc truy xuất nguồn gốc khi mà không may xảy ra sự cố về mất an toàn thực phẩm hoặc vi phạm đối tượng kiểm dịch. Điều này cũng thể hiện sự minh bạch của sản phẩm khi xuất khẩu sang Trung Quốc.<br>\r\n<br>\r\nVấn đề cuối cùng là các lô hàng dưa hấu của Việt Nam được xuất khẩu qua tất cả các cửa khẩu đã được Tổng cục Hải quan Trung Quốc cấp phép nhập khẩu trái cây tươi.<br>\r\n<br>\r\n“Cần lưu ý là mặc dù có rất nhiều cửa khẩu giáp biên với Trung Quốc nhưng chỉ có một số cửa khẩu được phép nhập khẩu trái cây tươi do hệ thống cơ sở hạ tầng, trang thiết bị kiểm soát biên giới và phải được lấy mẫu kiểm dịch 2%”, ông Ngô Xuân Nam nhấn manh.<br>\r\n<br>\r\nVề lộ trình thực hiện, ông Ngô Xuân Nam cho biết, ngay sau khi Nghị định thư có hiệu lực đòi hỏi từ vùng trồng đến cơ sở đóng gói phải chuẩn hóa, tuân thủ theo quy định, yêu cầu của thị trường nhập khẩu. Đây là điều kiện rất thuận lợi cho vùng trồng của Việt Nam, cho người nông dân và hợp tác xã cũng như các cơ sở đóng gói liên quan đến sản phẩm dưa hấu xuất khẩu sang thị trường Trung Quốc.<br>\r\n<br>\r\nThuận lợi vì đây không phải là lần đầu tiên Việt Nam ký Nghị định thư về xuất khẩu trái cây tươi sang thị trường Trung Quốc. Việt Nam đã có nhiều nhiều nghị định thư, ví dụ quả măng cụt, chuối tươi… và gần đây nhất là sầu riêng.<br>\r\n<br>\r\nNhư vậy, nông dân, doanh nghiệp, hợp tác xã cũng đã làm quen với các quy định này và hiện đang đáp ứng tốt các quy định của thị trường Trung Quốc. Riêng với trái cây tươi, đối tượng kiểm dịch tùy từng sản phẩm có đối tượng kiểm dịch khác nhau, kiểm dịch thực vật là khác nhau. Vì vậy, các vùng trồng, doanh nghiệp Việt Nam phải lưu ý để kiểm soát đúng đối tượng kiểm dịch mà phía Trung Quốc quan tâm để đảm bảo khi xuất khẩu.<br>\r\n<br>\r\nTheo ông Ngô Xuân Nam, đây là bước tiến để chuẩn hóa ngành hàng phù hợp với chủ trương của Bộ Nông nghiệp và Phát triển nông thôn. Không riêng ngành hàng trái cây tươi mà tất cả các ngành hàng nông sản, thực phẩm khi xuất khẩu không chỉ sang thị trường Trung Quốc mà sang các thị trường khác nhau đều được chuẩn hóa.<br>\r\n<br>\r\nChủ trương của Bộ Nông nghiệp và Phát triển nông thôn cũng yêu cầu các cơ quan, đơn vị chuyên môn, các vùng trồng phải từng bước chuẩn hóa ngành hàng để đảm bảo nông sản, thực phẩm Việt Nam khi xuất khẩu đi các thị trường đáp ứng yêu cầu về an toàn vệ sinh thực phẩm, về kiểm dịch động, thực vật (SPS) để vừa đáp ứng tốt yêu cầu về pháp lý, vừa đảm bảo sức khỏe người tiêu dùng, ông Ngô Xuân Nam cho hay.</p>\r\n</div>\"', 'https://cdnmedia.baotintuc.vn/Upload/YZmStSDTjb0M07hFJ2gA/files/2023/12/12/dua-hau-131223.jpg', 3, 3, '2023-12-14', 1, 1),
(25, 'Công bố 100 doanh nghiệp bền vững tại Việt Nam năm 2023', '\"<div id=\"\"divfirst\"\"><div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/xWDHf0fP0gRVbF1yzOohA/files/2023/12/mrphamtancong.jpg\"\">\r\n<figcaption>Ông Phạm Tấn Công, Chủ tịch VCCI, Trưởng ban chỉ đạo Chương trình CSI 2023 phát biểu tại lễ công bố.</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Năm 2023 là năm thứ 8 liên tiếp Chương trình Đánh giá, Công bố Doanh nghiệp bền vững tại Việt Nam (CSI) được VCCI chủ trì tổ chức theo sự chỉ đạo của Chính phủ, với sự phối hợp của Bộ Lao động, Thương binh và Xã hội, Bộ Tài nguyên và Môi trường, Tổng Liên đoàn Lao động Việt Nam,&nbsp;đặc biệt có thêm sự tham gia của Ban Kinh tế Trung ương trong Ban chỉ đạo Chương trình từ năm nay. Điều này thể hiện uy tín và mức độ lan tỏa của Chương trình CSI.&nbsp;</p>\r\n\r\n<p>Phát biểu khai mạc Lễ công bố, ông Phạm Tấn Công, Chủ tịch VCCI, Trưởng ban chỉ đạo Chương trình CSI 2023 chia sẻ: “Mục tiêu hỗ trợ, thúc đẩy xây dựng cộng đồng doanh nghiệp kinh doanh bền vững đã được VCCI bền bỉ theo đuổi từ hai thập kỷ. Với sự phối hợp của các ban, bộ, ngành, cơ quan, tổ chức trong nước và quốc tế, VCCI đã tiên phong xây dựng và triển khai nhiều chương trình, dự án, hoạt động tuyên truyền nâng cao nhận thức, đào tạo, tư vấn chia sẻ kiến thức, cổ vũ, động viên,&nbsp;hỗ trợ cộng đồng DN thực hành kinh doanh trách nhiệm, bền vững\"\".</p>\r\n\r\n<p>Cũng theo Chủ tịch VCCI, sự ổn định và tăng trưởng bền vững trong hoạt động sản xuất kinh doanh của những doanh nghiệp được vinh danh trong Lễ công bố CSI 2023 là minh chứng cho sự chọn lựa đúng đắn khi họ đã dấn thân, tiên phong áp dụng các tiêu chí bền vững trên cả 3 phương diện môi trường, xã hội, quản trị (ESG) cho chiến lược kinh doanh dài hạn của doanh nghiệp. “Chỉ có sự cam kết và hành động theo chiến lược bền vững sẽ giúp doanh nghiệp vượt qua các khó khăn, thách thức để phát triển, thịnh vượng,&nbsp;kiến tạo hạnh phúc bền lâu”, ông Phạm Tấn&nbsp;Công nhấn mạnh.&nbsp;</p>\r\n\r\n<div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/xWDHf0fP0gRVbF1yzOohA/files/2023/12/1312mrta.jpg\"\">\r\n<figcaption>Ông Trần Tuấn Anh, Ủy viên Bộ Chính trị, Trưởng ban Kinh tế Trung ương phát biểu tại lễ công bố.</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Phát biểu chỉ đạo tại chương trình, ông Trần Tuấn Anh, Ủy viên Bộ Chính trị, Trưởng ban Kinh tế Trung ương đánh giá cao sáng kiến của VCCI phối hợp với các đơn vị liên quan tổ chức Chương trình CSI trong suốt 8 năm qua. Trưởng ban Kinh tế Trung ương&nbsp;cũng chia sẻ Nghị quyết số 41-NQ/TW về xây dựng và phát huy vai trò của đội ngũ doanh nhân Việt Nam trong thời kỳ mới được Bộ Chính trị ban hành vào tháng 10 vừa qua đã nhấn mạnh, quan tâm hơn đến các tiêu chí đánh giá sự lớn mạnh về chất lượng của đội ngũ doanh nhân có tầm nhìn, trí tuệ, đạo đức, tinh thần kinh doanh, làm giàu chính đáng, năng động, sáng tạo, năng lực quản trị tiên tiến, tuân thủ pháp luật, có đạo đức, văn hoá kinh doanh mang bản sắc dân tộc; có trách nhiệm xã hội, ý thức bảo vệ môi trường. Đây chính là các tiêu chí thể hiện sự phát triển bền vững của doanh nghiệp, được cụ thể hóa trong Bộ chỉ số CSI mà VCCI xây dựng.</p>\r\n\r\n<p>Ông Trần Tuấn Anh đề nghị doanh nghiệp, doanh nhân Việt Nam cần xây dựng văn hóa kinh doanh bền vững, gắn kết thành công, tăng trưởng dài hạn của mình với lợi ích bền vững của cộng đồng, xã hội và môi trường. Đồng thời,&nbsp;cần phát huy hơn nữa tính chủ động, năng lực sáng tạo, linh hoạt, hợp tác tạo giá trị gia tăng cho các bên; cũng như cần chủ động bám sát, tuân thủ các đường lối, chính sách phát triển của Đảng, Nhà nước, Chính phủ, từ đó tìm ra những hướng đi mới, cơ hội mới, đón đầu và nắm bắt kịp thời xu thế, giúp tạo ra lợi thế cạnh tranh cho chính doanh nghiệp.</p>\r\n\r\n<div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/xWDHf0fP0gRVbF1yzOohA/files/2023/12/1312benvung.jpg\"\">\r\n<figcaption>Ông Trần Tuấn Anh, Ủy viên Bộ Chính trị, Trưởng ban Kinh tế Trung ương và ông Phạm Tấn Công, Chủ tịch VCCI trao chứng nhận cho các doanh nghiệp.</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Cũng tại Lễ công bố, ông Nguyễn Quang Vinh, Phó Chủ tịch VCCI, Chủ tịch VBCSD, Phó Trưởng ban chỉ đạo Chương trình CSI 2023 một lần nữa nhấn mạnh chuyển đổi tư duy kinh doanh sang kinh doanh bền vững là điều doanh nghiệp cần phải làm vì chính lợi ích của mình. Ông Vinh khuyến khích các doanh nghiệp trong Top 100 doanh nghiệp bền vững 2023 cùng lan tỏa, chia sẻ Bộ chỉ số CSI 2023 đến các doanh nghiệp, đối tác trong chuỗi giá trị, để cùng xây dựng một hệ sinh thái doanh nghiệp “bền” và “vững”, giúp nâng cao năng lực cạnh tranh của doanh nghiệp, củng cố vị thế của mình tốt hơn trong chuỗi giá trị của các doanh nghiệp lớn&nbsp;và từ đó phát triển lớn mạnh, bền vững hơn.</p>\r\n\r\n<p>Ông Nguyễn Quang Vinh &nbsp;cho biết tr', 'https://cdnmedia.baotintuc.vn/Upload/xWDHf0fP0gRVbF1yzOohA/files/2023/12/mrphamtancong.jpg', 4, 4, '2023-12-14', 0, 1),
(26, 'Các tỉnh, thành phố ở Bắc Bộ chủ động ứng phó với rét đậm, rét hại', '\"<div id=\"\"divfirst\"\"><div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" height=\"\"462\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/xWDHf0fP0gRVbF1yzOohA/files/2023/03/1303kkl.jpeg\"\" width=\"\"665\"\">\r\n<figcaption>Các tỉnh, thành phố khu vực Bắc Bộ chủ động ứng phó với rét đậm, rét hại.&nbsp;Ảnh minh họa: TTXVN</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Theo tin từ Trung tâm Dự báo khí tượng thủy văn Quốc gia,&nbsp;từ ngày&nbsp;17-20/12,&nbsp;khu vực Bắc Bộ&nbsp;có khả năng&nbsp;cao&nbsp;xảy ra một đợt rét đậm trên diện rộng, vùng núi rét hại, nhiệt độ thấp nhất có thể xuống dưới 10 độ C, vùng núi cao có thể xuống dưới 3 độ C,&nbsp;cần đề phòng&nbsp;xảy ra băng giá và sương muối.</p>\r\n\r\n<p>Để chủ động ứng phó&nbsp;giảm thiểu thiệt hại,&nbsp;Văn phòng thường trực Ban Chỉ đạo quốc gia về phòng, chống thiên tai đề nghị Ban Chỉ huy Phòng, chống thiên tai và Tìm kiếm cứu nạn các&nbsp;Bộ; các tỉnh, thành phố theo&nbsp;dõi chặt chẽ các bản tin cảnh báo, dự báo để thông báo, hướng dẫn kịp thời, thường xuyên cho các cấp chính quyền&nbsp;cơ sở, nhân dân chủ động phòng tránh rét đậm, rét hại; tuyệt đối không dùng bếp than để sưởi ấm trong phòng kín tránh xảy ra những sự cố đáng tiếc, gây thiệt hại về người như tại một số địa phương trong những năm gần đây;&nbsp;có phương án đảm bảo an toàn&nbsp;cho học sinh.</p>\r\n\r\n</div>\"', 'https://cdnmedia.baotintuc.vn/Upload/xWDHf0fP0gRVbF1yzOohA/files/2023/03/1303kkl.jpeg', 3, 4, '2023-12-14', 0, 0),
(27, 'Vụ sập mái nhà khi đang thi công ở Thái Bình: Khởi tố, bắt giam chủ nhà', '<div id=\"divend\"><p>Theo đó, căn cứ tài liệu, chứng cứ thu thập, ngày 13/12, Cơ quan Cảnh sát điều tra Công an huyện Thái Thụy ra Quyết định khởi tố vụ án, khởi tố bị can và Lệnh bắt bị can để tạm giam đối với Nguyễn Văn Đoàn (sinh năm 1985, trú tại tổ dân phố số 8, thị trấn Diêm Điền) để điều tra về tội “Vi phạm quy định về xây dựng gây hậu quả nghiêm trọng”, quy định tại Điều 298, Bộ luật Hình sự.&nbsp;<br>', 'https://cdnmedia.baotintuc.vn/Upload/3qVxwVtNEPp6Wp9kkF77g/files/2023/12/12/sap-mai-nha-121223-1.jpg', 2, 5, '2023-12-14', 2, 1),
(28, 'Hỏa hoạn thiêu trụi của hàng kim khí trên phố Đại Linh, Hà Nội', '\"<div id=\"\"divfirst\"\"><p>Vào khoảng 14 giờ ngày 13/12, đã xảy ra cháy tại cửa hàng cơ khí, phế liệu ở ngõ 54 phố Đại Linh, Tổ dân phố 17, phường Trung Văn. Do chất cháy chủ yếu là giấy, nhựa, nên đám cháy bùng phát lớn, khói bao trùm toàn bộ khu nhà tạm chứa phế liệu và thiết bị cơ khí.</p>\r\n\r\n<figure class=\"\"image\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/CCcQv1fjdlI5Hob1jh0mA/files/2023/12/13/chay/9.jpg\"\">\r\n<figcaption>Ngọn lửa tạo thành cột khói cao nghi ngút</figcaption>\r\n</figure>\r\n\r\n<p>Ngay sau khi nhận được tin báo, lực lượng Cảnh sát PCCC và CNCH&nbsp;Công an quận Nam Từ Liêm đã điều động phương tiện và lực lượng khẩn trương đến hiện trường xử lý, ngăn cháy lan, cháy lớn và tổ chức tìm kiếm cứu nạn.</p>\r\n\r\n<p>\r\n<iframe id=\"\"divVideo_2\"\" src=\"\"https://baotintuc.vn/Player.aspx?vid=divVideo_2&amp;fileId=https://cdnmedia.baotintuc.vn/Upload/CCcQv1fjdlI5Hob1jh0mA/files/2023/12/13/chay/chay.mp4&amp;fileImg=https://cdnmedia.baotintuc.vn/Upload/CCcQv1fjdlI5Hob1jh0mA/files/2023/12/13/chay/3.jpg&amp;width=636&amp;height=380&amp;newsId=20231213164941683&amp;refUrl=https://baotintuc.vn&amp;isWebsite=True&amp;title=Hỏa hoạn thiêu trụi của hàng kim khí trên phố Đại Linh, Hà Nội\"\" frameborder=\"\"0\"\" scrolling=\"\"no\"\" width=\"\"636\"\" height=\"\"380\"\" msallowfullscreen=\"\"\"\" oallowfullscreen=\"\"\"\" mozallowfullscreen=\"\"\"\" webkitallowfullscreen=\"\"\"\" allowfullscreen=\"\"\"\"></iframe>\r\n</p>\r\n\r\n<p>Do khu vực xảy hỏa hoạn có nhiều nhà tạm, có nguy cơ cao cháy lan, nên lực lượng Cảnh sát PCCC và CNCH&nbsp;Công an quận Thanh Xuân, Trường Đại học PCCC cũng đã được điều động, chi viện,&nbsp;phối hợp dập lửa.</p>\r\n\r\n<p>Sau khoảng 40 phút đám cháy được khống chế.</p>\r\n\r\n<p>Theo thống kê ban đầu, khu vực cháy là nhà tạm khung thép lợp mái tôn chủ nhân dùng làm cửa hàng cơ khí và chứa hàng phế liệu trên diện tích khoảng 120 m2.</p>\r\n\r\n<p>Vụ cháy không có thương vong về người, chỉ thiệt hại về tài sản, cơ quan chức năng đang thống kê thiệt hại ban đầu và điều tra nguyên nhân vụ cháy.</p>\r\n\r\n<figure class=\"\"image\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/CCcQv1fjdlI5Hob1jh0mA/files/2023/12/13/chay/8.jpg\"\">\r\n<figcaption>Đám cháy tạo khói bốc cao bao trùm cả một khu vực.</figcaption>\r\n</figure></div>\"', 'https://cdnmedia.baotintuc.vn/Upload/CCcQv1fjdlI5Hob1jh0mA/files/2023/12/13/chay/8.jpg', 2, 5, '2023-12-14', 1, 1),
(29, '\"Bổ sung quy định đưa tác phẩm nhiếp ảnh từ Việt Nam ra nước ngoài dự thi, liên hoan\r\n\"', '\"<div id=\"\"divfirst\"\"><div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/DmtgOUlHWBO5POIHzIwr1A/files/2023/12/13/nhiep-anh-13122023a.jpg\"\">\r\n<figcaption>Các tác phẩm nhiếp ảnh được trưng bày trong triển lãm \"\"Hà Nội - Một thành phố trong nhiếp ảnh\"\" tại Trung tâm Văn hóa Nghệ thuật 22 Hàng Buồm. Ảnh: Thanh Tùng/TTXVN</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Với Nghị định số 72/2016/NĐ-CP, sửa đổi, bổ sung khoản 2, khoản 3 Điều 10 đưa tác phẩm nhiếp ảnh từ Việt Nam ra nước ngoài dự thi, liên hoan. Theo đó, tổ chức (bộ, ban, ngành, đoàn thể Trung ương) đưa tác phẩm nhiếp ảnh từ Việt Nam ra nước ngoài dự thi, liên hoan với danh nghĩa đại diện cho quốc gia Việt Nam nộp trực tiếp hoặc qua bưu chính hoặc qua môi trường điện tử một văn bản thông báo đến cơ quan nhà nước có thẩm quyền.</p>\r\n\r\n<p>Văn bản thông báo nêu rõ thông tin của tổ chức, cá nhân tổ chức thi, liên hoan tác phẩm nhiếp ảnh, tên gọi, chủ đề, nội dung, thời gian, địa điểm của cuộc thi, liên hoan tác phẩm nhiếp ảnh.</p>\r\n\r\n</div>\"', 'https://cdnmedia.baotintuc.vn/Upload/DmtgOUlHWBO5POIHzIwr1A/files/2023/12/13/nhiep-anh-13122023a.jpg', 2, 6, '2023-12-14', 0, 1),
(30, '\"Xác lập kỷ lục chế biến các món bánh làm từ gạo, nếp nhiều nhất Việt Nam\r\n\"', '\"<div id=\"\"divfirst\"\"><div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/DmtgOUlHWBO5POIHzIwr1A/files/2023/12/13/mon-banh-13122023.jpg\"\">\r\n<figcaption>200 món bánh đa dạng về màu sắc, tên gọi đặc trưng của cả nước. Ảnh: Duy Khương/TTXVN</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Tại chương trình, cùng với những món bánh dân gian truyền thống nổi tiếng được nhiều người biết đến như: bánh chưng, bánh dày, bánh xèo, bánh tét, bánh cống, bánh da lợn..., nhiều món bánh mới mang hương vị đặc trưng của địa phương đã xuất hiện thêm như: bánh tét ngũ sắc, bánh xèo ngũ sắc, bánh ram tôm thịt, bánh nếp mặn lá chuối, bánh cuốn trứng, bánh con sùng ngũ sắc, bánh da lợn ngũ sắc, bánh bầu, bánh củ cải...</p>\r\n\r\n<div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/DmtgOUlHWBO5POIHzIwr1A/files/2023/12/13/mon-banh-13122023c.jpg\"\">\r\n<figcaption>Đại diện BTC thẩm định, kiểm tra số lượng bánh đạt kỷ lục. Ảnh: Duy Khương/TTXVN</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Theo ông Lê Minh Dũng, Giám đốc Trung tâm Xúc tiến Du lịch tỉnh Hậu Giang, sự kiện quy tụ 40 nghệ nhân ẩm thực, đầu bếp chuyên nghiệp có tay nghề, uy tín đại diện cho các huyện, thị xã, thành phố của tỉnh Hậu Giang và các tỉnh, thành phố lân cận như: Cần Thơ, Kiên Giang, Bến Tre, Vĩnh Long.</p>\r\n\r\n</div>\"', 'https://cdnmedia.baotintuc.vn/Upload/DmtgOUlHWBO5POIHzIwr1A/files/2023/12/13/mon-banh-13122023.jpg', 1, 6, '2023-12-14', 6, 0),
(31, '\"Trao giải cuộc thi Tìm hiểu về lịch sử truyền thống yêu nước của dân tộc Việt Nam\"', '<p>\"</p><p><strong><em><u><img src=\"\">Ban tổ chức trao giải Nhất cho cô giáo Nguyễn Thị Thiên Sinh, giáo viên Trường Phổ thông dân tộc nội trú tỉnh Bắc Kạn với tác phẩm \"\"Hành quân theo bước chân những người anh hùng\"\". Ảnh: TĐ</u></em></strong></p><p>Phát biểu tại buổi lễ tổng kết và trao giải, ông&nbsp;Triệu Ngọc Lâm, Tổng biên tập Báo Giáo dục và Thời đại cho biết, cuộc thi “Tìm hiểu về lịch sử truyền thống yêu nước của dân tộc Việt Nam” được tổ chức nhằm đẩy mạnh thông tin, tuyên truyền về lịch sử dân tộc, truyền thống dựng nước và giữ nước, đoàn kết dân tộc, bồi đắp tinh thần yêu quê hương, các tấm gương tiêu biểu trong việc xây dựng,&nbsp;bảo vệ Tổ quốc hiện nay tới giáo viên, sinh viên,&nbsp;học sinh cả nước.</p><p>Sau hơn hai tháng triển khai, cuộc thi đã có sức hút nhất định đối với người dân trên khắp cả nước; không chỉ các em học sinh, sinh viên, giáo viên,&nbsp;ngay cả những bậc phụ huynh, những người cao tuổi cũng hết sức nhiệt tình tham gia. Ban tổ chức cuộc thi đã nhận được gần 22.000 tác phẩm. Với 178 tác phẩm vào vòng sơ khảo,&nbsp;21 tác phẩm vào vòng chung khảo.</p><p>Ban tổ chức đã quyết định công nhận trao giải cho 16 tác phẩm , trong đó có 2 giải tập thể,&nbsp;12 giải cá nhân,&nbsp;2 giải thưởng phụ. Ở một số địa phương, cơ sở giáo dục đã tổ chức chấm và chọn những tác phẩm chất lượng để gửi về Ban tổ chức cuộc thi.</p><p>Nhiều Sở Giáo dục và Đào tạo (GD&amp;ĐT)&nbsp;tham gia với đông đủ bài thi của giáo viên và học sinh trong toàn ngành. Tiêu biểu là các Sở GD&amp;ĐT: Bắc Kạn, Hòa Bình, Bắc Giang, Hà Nội, Hải Phòng, Hưng Yên, Hải Dương, Vĩnh Phúc, Bắc Ninh, Phú Thọ, Nghệ An, Hậu Giang, Cần Thơ…</p><p>Tác giả Nguyễn Thị Thiên Sinh, giáo viên Trường Phổ thông dân tộc nội trú tỉnh Bắc Kạn, đạt giải Nhất cuộc thi với tác phẩm \"\"Hành quân theo bước chân những người anh hùng\"\" mong rằng, qua cuộc thi lan tỏa tình yêu lịch sử tới đông đảo các thế hệ học trò; đồng thời, khơi dậy tình yêu lịch sử yêu quê hương đất nước tự hào về truyền thống anh dũng của cha ông.&nbsp;</p><p>Giải Nhất với tác phẩm: Hành quân theo bước chân những người anh hùng Tác giả Nguyễn Thị Thiên Sinh, giáo viên Trường Phổ thông dân tộc nội trú tỉnh Bắc Kạn.</p><p>Hai giải Nhì với các tác phẩm: Giáo dục truyền thống yêu nước của học sinh THCS Tác giả Nguyễn Thị Chuyền, Giáo viên Trường THCS thị trấn Nhã Nam, huyện Tân Yên, tỉnh Bắc Giang; Kiên cường nước Việt Tác giả Hoàng Bảo Châu, học sinh lớp 8A1, trường THCS Phan Đình Giót, quận Thanh Xuân, TP Hà Nội.</p><p>\"</p>', 'https://cdnmedia.baotintuc.vn/Upload/gYJXHsn6VBCJnSv7rj8xYQ/files/2023/12/gianhat.jpg', 1, 7, '2023-12-14', 4, 1),
(32, '\"Đại học Quốc gia Hà Nội tiếp tục đón nhận Huân chương Lao động hạng Nhất\r\n\"', '\"<div id=\"\"divfirst\"\"><figure class=\"\"image\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/gYJXHsn6VBCJnSv7rj8xYQ/files/2023/12/qg.jpg\"\">\r\n<figcaption>Đại học Quốc gia Hà Nội tiếp tục đón&nbsp;&nbsp;nhận Huân chương Lao động hạng Nhất. Ảnh: VNU</figcaption>\r\n</figure>\r\n\r\n<p>Nhân dịp này, đồng chí Nguyễn Phú Trọng, Tổng Bí thư Ban Chấp hành Trung ương Đảng Cộng sản Việt Nam đã gửi thư chúc mừng Đại học Quốc gia Hà Nội (ĐHQGHN).</p>\r\n\r\n<p>Trong thư viết: \"\"Như chúng ta đã biết, Nghị quyết số 45-NQ/TW của Hội nghị lần thứ tám Ban Chấp hành Trung ương Đảng khóa XIII về tiếp tục xây dựng và phát huy vai trò của đội ngũ trí thức đáp ứng yêu cầu phát triển đất nước nhanh và bền vững trong giai đoạn mới đã đề ra nhiệm vụ tập trung xây dựng cơ chế, chính sách đột phá và đầu tư nguồn lực để phát triển cơ sở giáo dục đại học đạt trình độ tiên tiến, trong đó ĐHQGHN&nbsp;được xếp hạng trong nhóm 500 đại học hàng đầu thế giới vào năm 2030. Vì vậy, tôi tin tưởng và mong rằng tập thể thày và trò ĐHQGHN&nbsp;sẽ phát huy trí tuệ, lòng nhiệt huyết, niềm đam mê và sức sáng tạo để hoàn thành thắng lợi mục tiêu nêu trên\"\".&nbsp;</p>\r\n\r\n<p>Trong thư, Tổng Bí thư Nguyễn Phú Trọng cũng nêu:&nbsp;“Sau 30 năm phấn đấu xây dựng và phát triển, ĐHQGHN đã đạt được các thành tích xuất sắc và thực sự trở thành trung tâm đào tạo, nghiên cứu khoa học đa ngành lớn, có vị trí đặc biệt quan trọng hàng đầu của đất nước, có vai trò nòng cốt và đầu tầu trong hệ thống giáo dục đại học Việt Nam”.&nbsp;</p>\r\n\r\n<p>Phát biểu tại buổi lễ, đồng chí Đỗ Văn Chiến, Bí thư Trung ương Đảng, Chủ tịch Ủy ban Trung ương Mặt trận Tổ quốc Việt Nam&nbsp;cho biết: “Thành tựu sau 30 năm thực hiện mô hình Đại học đa ngành, đa lĩnh vực góp phần tô thắm thêm truyền thống 117 năm vẻ vang từ Đại học Đông Dương, Trường Đại học Việt Nam và Trường Đại học Tổng hợp đóng góp xứng đáng công sức của mình vào sự nghiệp xây dựng và bảo vệ Tổ quốc; được Đảng, Nhà nước ghi nhận, tặng thưởng Huân chương Sao Vàng và nhiều phần thưởng cao quý khác, trong đó có Huân chương Lao động Hạng Nhất đón nhận hôm nay”.</p>\r\n\r\n<p>Đồng thời đồng chí Đỗ Văn Chiến tin tưởng, với niềm vui và khí thế của lễ kỷ niệm hôm nay cùng với những chủ trương, chính sách mới của Đảng và Nhà nước sẽ tạo ra xung lực mới để đội ngũ tri thức, các Giáo sư, Phó Giáo sư, Tiến sỹ, nhà khoa học, các thầy giáo, cô giáo, các em học sinh, sinh viên Đại học Quốc gia Hà Nội thi đua lập thành tích xuất sắc hơn nữa, hoàn thành sứ mệnh cao cả của mình; thực sự là nòng cốt và đầu tàu trong hệ thống giáo dục đại học và nghiên cứu khoa học và chuyển giao công nghệ của nước ta.</p>\r\n\r\n<p>Tại buổi lễ, GS. Lê Quân, Giám đốc ĐHQGHN điểm lại một số thành tựu và bài học phát triển của ĐHQGHN trong những năm qua như:&nbsp;ĐHQGHN đã trở thành một đại học đa ngành, đa lĩnh vực;&nbsp;ĐHQGHN tiên phong đổi mới, khẳng định uy tín trong đào tạo nguồn nhân lực chất lượng cao, trình độ cao, bồi dưỡng nhân tài, đáp ứng yêu cầu phát triển kinh tế - xã hội và hội nhập của đất nước; Hoạt động khoa học công nghệ phát triển mạnh về quy mô và đạt được một số kết quả tầm cỡ quốc tế, góp phần tích cực vào sự nghiệp công nghiệp hóa, hiện đại hóa đất nước; ĐHQGHN thực hiện hiệu quả mô hình hợp tác trong đào tạo và nghiên cứu, chuyển giao Khoa học và Công nghệ và cung ứng dịch vụ; Vị thế, uy tín quốc tế của ĐHQGHN được nâng cao. Đến nay, ĐHQGHN đã thiết lập quan hệ hợp tác với trên 320 trường đại học, tổ chức khoa học và công nghệ quốc tế và các tập đoàn đa quốc gia.</p>\r\n\r\n<figure class=\"\"image\"\"><img alt=\"\"Chú thích ảnh\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/gYJXHsn6VBCJnSv7rj8xYQ/files/2023/12/lequan.jpg\"\">\r\n<figcaption>GS. Lê Quân, Giám đốc Đại học Quốc gia Hà Nội phát biểu tại buổi lễ. Ảnh: VNU</figcaption>\r\n</figure>\r\n\r\n</div>\"', 'https://cdnmedia.baotintuc.vn/Upload/gYJXHsn6VBCJnSv7rj8xYQ/files/2023/12/qg.jpg', 2, 7, '2023-12-14', 1, 1),
(33, '\"Nguyễn Filip đủ điều kiện thi đấu cho Đội tuyển Việt Nam tại vòng Chung kết Asian Cup 2023\"', '<p>\"</p><h3><strong><img src=\"\">Thủ môn Nguyễn Filip. Ảnh: VPF</strong></h3><p>Trước đó, Nguyễn Filip đã hoàn tất thủ tục để có quốc tịch Việt Nam và được Huấn luyện viên trưởng Philippe Troussier điền tên vào danh sách sơ bộ gồm 50 cầu thủ của Đội tuyển Việt Nam. Danh sách tập trung Đội tuyển Việt Nam, danh sách bổ sung, thay thế và danh sách chính thức của Đội tuyển Việt Nam tham dự vòng Chung kết Asian Cup 2023 sẽ xoay quanh 50 cái tên có trong danh sách đăng ký sơ bộ.</p><p>Việc Nguyễn Filip phải chờ xác nhận của AFC là do thủ môn này đã từng được triệu tập vào Đội tuyển Cộng hòa Séc với tên đăng ký theo quốc tịch Cộng hòa Séc là Filip Nguyễn. Tuy nhiên, thủ môn này vẫn chưa ra sân thi đấu trận nào trong màu áo Đội tuyển Cộng hòa Séc. Đây cũng là cơ sở để AFC xác nhận Nguyễn Filip đủ điều kiện thi đấu cho Đội tuyển Việt Nam theo đúng quy định của FIFA.</p><p>Để chuẩn bị cho Vòng Chung kết Asian Cup 2023, Đội tuyển Việt Nam dự kiến sẽ hội quân trở lại vào ngày 28/12 tới, sau khi kết thúc vòng 8 V.League 1 - 2023/24. Thầy trò Huấn luyện viên Philippe Troussier sẽ tập luyện tại Trung tâm Đào tạo Bóng đá trẻ Việt Nam cho đến ngày 5/1/2024 sẽ lên đường sang Qatar - quốc gia đăng cai tổ chức vòng Chung kết Asian Cup 2023.</p><p>\"</p>', 'https://cdnmedia.baotintuc.vn/Upload/EqV5H9rWgvy9oNikwkHLXA/files/09122023VanLam4.jpg', 3, 8, '2023-12-14', 1, 1),
(34, '\"Việt Nam nỗ lực giành vé dự World Cup Futsal lần thứ 3\r\n\"', '\"<div id=\"\"divfirst\"\"><div style=\"\"text-align:center\"\">\r\n<figure class=\"\"image\"\" style=\"\"display:inline-block\"\"><img alt=\"\"Chú thích ảnh\"\" height=\"\"533\"\" src=\"\"https://cdnmedia.baotintuc.vn/Upload/EqV5H9rWgvy9oNikwkHLXA/files/04102023futsalvietnam.jpg\"\" width=\"\"800\"\">\r\n<figcaption>Tuyển futsal Việt Nam lên đường dự giải futsal châu Á với 15 thành viên. Ảnh: VFF</figcaption>\r\n</figure>\r\n</div>\r\n\r\n<p>Đội tuyển Futsal Việt Nam đã giành quyền tham dự vòng Chung kết futsal châu Á 2024 với ngôi nhất bảng D, sau 3 trận&nbsp;thắng trước Hàn Quốc, Mông Cổ và Nepal tại vòng đấu loại. Mục tiêu của thầy trò Huấn luyện viên Diego Giustozzi tại vòng chung kết là cạnh tranh vé dự World Cup futsal lần thứ 3 trong lịch sử.</p>\r\n\r\n<p>Tham dự vòng Chung kết Giải Futsal châu Á 2024 có 16 đội tuyển và được chia vào 4 nhóm hạt giống để bốc thăm chia bảng. Đội tuyển Việt Nam thuộc nhóm số 2 cùng với Tajikistan, Kuwait và Ả Rập Xê Út. Nhóm số 1 gồm chủ nhà Thái Lan, Nhật Bản, Iran và Uzbekistan. Nhóm số 3 gồm Iraq, Bahrain, Hàn Quốc và Myanmar. Nhóm số 4 gồm Afghanistan, Kyrgyzstan, Australia và Trung Quốc.</p>\r\n\r\n<p>16 đội thuộc 4 nhóm hạt giống sẽ được bốc thăm vào 4 bảng, mỗi bảng 4 đội. Việc bốc thăm sẽ được tiến hành theo trình tự từ nhóm 4 cho đến nhóm 1. Chủ nhà Thái Lan được ấn định ở mã số 1 tại bảng A (A1), do vậy, các đội Nhật Bản, Iran, Uzbekistan sẽ được bốc thăm vào các vị trí B1, C1, D1.</p>\r\n\r\n<p>Vòng Chung kết Giải futsal châu Á 2024 sẽ diễn ra tại Thái Lan từ ngày 17-28/4/2024. Các đội sẽ thi đấu theo thể thức vòng tròn một lượt tính điểm xếp hạng tại mỗi bảng. Hai đội Nhất, Nhì tại 4 bảng (8 đội) sẽ giành quyền vào tứ kết. Bốn đội thắng tại tứ kết sẽ đi tiếp vào bán kết để chọn ra 2 đội chiến thắng giành quyền vào tranh ngôi vô địch.</p></div>\"', 'https://cdnmedia.baotintuc.vn/Upload/EqV5H9rWgvy9oNikwkHLXA/files/04102023futsalvietnam.jpg', 2, 8, '2023-12-14', 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(500) NOT NULL,
  `user` varchar(500) NOT NULL,
  `pass` varchar(500) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `user`, `pass`, `status`) VALUES
(1, 'Phương', 'phuong', '$2y$10$QDz1sCGncaw.bYeoxL01EeBd1Ts4m8TyLu/rxR3QakzlPwQ08700m', 1),
(2, 'Chiến', 'chien', '$2y$10$svLexgrtNDOtHQFvkPXDyeYx27gGfu38Nx7cw4gceApoNvkocGeY.', 1),
(3, 'Minh Anh', 'manh', '$2y$10$3HRhyx9ZERcO6n4egIh7OOe3i9QdAXcqUpIaUpDbNURF7jgIzJqJK', 1),
(4, 'Nguyễn Linh', 'linh', '$2y$10$3npdAjGSavTWbN40Jnj3reqOf8PDxOJistgzhrZR6RpMbgZEpLhnG', 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmt__news` (`new_id`),
  ADD KEY `cmt__users` (`user_id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `new__author` (`author_id`),
  ADD KEY `new__category` (`category_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `author`
--
ALTER TABLE `author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `cmt__news` FOREIGN KEY (`new_id`) REFERENCES `news` (`id`),
  ADD CONSTRAINT `cmt__users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `new__author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`),
  ADD CONSTRAINT `new__category` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
