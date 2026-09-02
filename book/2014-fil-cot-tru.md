# Cột trụ ★★★★

**Tác giả đề:** Jakub Radoszewski, Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `fil`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/fil>


## Đề bài

Bajtazar là người quản lý một nhà kho lớn. Dự đoán mùa đông sắp tới sẽ rất khắc nghiệt, anh quyết định lắp hệ thống sưởi dưới sàn nhà kho.

Mặt bằng nhà kho là một hình chữ nhật có kích thước chẵn \(n\times m\), được chia thành các ô vuông đơn vị. Phần lớn các ô là diện tích kho, nhưng một số ô bị những cột trụ lớn chiếm chỗ; các cột này giúp gia cố kết cấu nhà kho. Trên mặt bằng, mỗi cột trụ chiếm một hình vuông \(2\times2\), gồm bốn ô vuông đơn vị. Các cột không nằm quá sát nhau: khoảng cách Euclid giữa tâm của hai cột bất kỳ ít nhất là \(6\). Ngoài ra, tâm mỗi cột cách mỗi bức tường ngoài của nhà kho ít nhất \(3\) đơn vị.

Hệ thống sưởi sử dụng một ống dẫn nhiệt duy nhất đặt dưới sàn. Ống phải đi qua tâm của tất cả các ô vuông đơn vị, trừ những ô bị cột trụ chiếm. Mỗi đoạn ống phải song song với một trong các bức tường, và ống chỉ được đổi hướng tại tâm ô vuông đơn vị. Điểm đầu và điểm cuối của ống phải trùng nhau. Tại điểm đó, nước đã nguội được dẫn ra ngoài và nước nóng được bơm vào ống.

Bajtazar nhờ bạn lập kế hoạch đường đi của ống dưới sàn. Để hỗ trợ, anh đặt một hệ tọa độ Descartes trên mặt bằng nhà kho: hoành độ thuộc đoạn \([0,n]\), tung độ thuộc đoạn \([0,m]\). Tọa độ tâm của mọi ô vuông đơn vị đều có dạng \(k+\frac12\), với \(k\in\mathbb N\).

### Dữ liệu vào

Dòng đầu chứa ba số nguyên \(n,m,f\)

\[
1\le n,m\le1000,
\]

trong đó \(n\) và \(m\) đều chẵn. Các số này lần lượt biểu thị hai kích thước của nhà kho và số cột trụ.

Mỗi dòng trong \(f\) dòng tiếp theo chứa hai số nguyên \(x_i,y_i\)

\[
0\le x_i\le n,\qquad 0\le y_i\le m,
\]

là tọa độ tâm của cột trụ thứ \(i\). Dữ liệu bảo đảm các cột thỏa mãn những điều kiện về khoảng cách đã nêu.

### Dữ liệu ra

Ở dòng đầu, in một từ `TAK` (có) hoặc `NIE` (không), tùy theo có thể lắp hệ thống sưởi đúng yêu cầu của Bajtazar hay không.

Nếu câu trả lời là `TAK`, dòng thứ hai phải mô tả một phương án đặt ống bằng một chuỗi gồm \(nm-4f\) chữ cái. Quy ước điểm bắt đầu của ống là \(\left(\frac12,\frac12\right)\). Mỗi đoạn tiếp theo được mã hóa như sau:

- vectơ \([0,1]\) bằng chữ `G`;
- vectơ \([0,-1]\) bằng chữ `D`;
- vectơ \([1,0]\) bằng chữ `P`;
- vectơ \([-1,0]\) bằng chữ `L`.

Nếu có nhiều phương án đúng, được phép in bất kỳ phương án nào.

### Ví dụ

**Dữ liệu vào**

```text
12 6 2
3 3
9 3
```

**Dữ liệu ra**

```text
TAK
PPPPPPPPPPPGGGLDDLLLLLGPPGLLLDDLLLGGGPPPPPPPPPPGLLLLLLLLLLLDDDDD
```

Đầu ra trong ví dụ tương ứng với sơ đồ sau:

![Sơ đồ đường ống của ví dụ trong nhà kho 12 nhân 6: hai cột trụ 2 nhân 2 nằm quanh các tâm (3,3) và (9,3), còn một chu trình khép kín màu đỏ đi qua đúng một lần mọi ô trống.](figures/2014-fil-fig-example.png)

## Lời giải

Ta có thể phát biểu bài toán **Cột trụ** bằng ngôn ngữ lý thuyết đồ thị. Xét đồ thị có một đỉnh cho mỗi ô vuông đơn vị không bị cột chiếm; hai đỉnh được nối bằng cạnh khi hai ô tương ứng có chung một cạnh. Bài toán yêu cầu tìm một **chu trình Hamilton**, tức một chu trình đi qua mỗi đỉnh đúng một lần.

Trong trường hợp tổng quát, nghĩa là khi cần một thuật toán giải được trên đồ thị bất kỳ, tìm chu trình Hamilton là một bài toán NP-đầy đủ. Vì thế, chưa có thuật toán hiệu quả nào được biết đến cho trường hợp tổng quát. Ta phải khai thác dạng đặc biệt của đồ thị trong bài này. Đồ thị ấy là đồ thị phẳng, nhưng chỉ riêng tính phẳng vẫn chưa đủ, vì tìm chu trình Hamilton trên đồ thị phẳng bất kỳ cũng là bài toán NP-đầy đủ.

### Chia mặt bằng thành các mảnh

Trước hết, xét một phiên bản đơn giản hơn: khoảng cách từ tâm mỗi cột đến **mỗi** cạnh của hình chữ nhật đều là số lẻ. Nói cách khác, nếu ghép các ô đơn vị thành những mảnh \(2\times2\), thì mỗi mảnh hoặc bị một cột trụ phủ kín, hoặc hoàn toàn không chứa ô nào thuộc cột trụ.

Trong mỗi mảnh loại thứ hai, ta đặt một chu trình độ dài \(4\), như ở Hình 1. Tiếp theo, lập một đồ thị mới: mỗi mảnh là một đỉnh, còn hai đỉnh kề nhau khi hai mảnh có chung một cạnh. Tìm một cây khung bất kỳ của đồ thị các mảnh. So sánh Hình 1 với hình trong ví dụ, ta dễ thấy cách dùng các cạnh của cây khung để nối những chu trình nhỏ thành một chu trình duy nhất: với mỗi cạnh cây khung, bỏ hai cạnh song song nằm hai phía của biên chung rồi nối chéo qua biên ấy. Mỗi phép ghép biến hai chu trình thành một mà vẫn giữ bậc của mọi ô bằng \(2\). Sau khi xử lý toàn bộ cây khung, ta thu được chu trình Hamilton cần tìm.

![Hình 1. Nhà kho được chia thành các mảnh 2 nhân 2. Mỗi mảnh không có cột chứa một chu trình bốn ô; các cạnh đen đậm tạo thành cây khung chỉ ra nơi ghép các chu trình nhỏ thành một chu trình lớn.](figures/2014-fil-fig-1.png)

Thuật toán này chạy trong thời gian

\[
O(nm+f).
\]

Với bài toán đầy đủ, ta phải cho phép chia hình chữ nhật thành các mảnh kém đều đặn hơn. Nếu khoảng cách từ tâm cột đến các cạnh hình chữ nhật đều là số chẵn, ta đặt cột trong một mảnh \(4\times4\). Nếu khoảng cách theo hai phương có tính chẵn lẻ khác nhau, ta dùng mảnh \(4\times6\) hoặc \(6\times4\), như Hình 2. Điều kiện về khoảng cách giữa tâm các cột bảo đảm những mảnh này không chồng lên nhau. Phần còn lại — dựng cây khung và ghép các chu trình — hoàn toàn tương tự.

![Hình 2. Hai cách bao quanh một cột trụ bằng chu trình: cột nằm giữa một mảnh 4 nhân 4, hoặc giữa một mảnh chữ nhật 4 nhân 6; trường hợp 6 nhân 4 là hình quay của trường hợp thứ hai.](figures/2014-fil-fig-2.png)

### Cách dựng đơn giản hơn

Bài toán còn có một lời giải đơn giản hơn. Đầu tiên, phủ toàn bộ hình chữ nhật bằng một chu trình dạng “lò sưởi” như bên trái Hình 3. Chu trình đi dọc các ô sát cạnh dưới, rồi lần lượt ngoằn ngoèo qua từng cột ô và đổi hướng sau mỗi cột.

Sau đó, lần lượt đặt từng cột trụ vào và sửa chu trình cục bộ sau mỗi lần đặt. Phần bên phải Hình 3 minh họa ba trường hợp cần xét:

- ở trường hợp bên trái, khoảng cách từ tâm cột đến cạnh trái của hình chữ nhật là số lẻ;
- ở hai trường hợp còn lại, khoảng cách ấy là số chẵn;
- trường hợp cuối cùng dành cho cột có tâm cách cạnh dưới đúng \(3\) đơn vị.

Mỗi phép sửa chỉ thay đổi một đoạn nhỏ của chu trình quanh cột mới: nó chuyển đường ống ra khỏi bốn ô bị cột chiếm và nối lại hai đầu đường đi sao cho kết quả vẫn là một chu trình duy nhất. Nhờ các điều kiện khoảng cách của đề bài, vùng sửa quanh các cột khác nhau không xung đột.

![Hình 3. Bên trái là chu trình “lò sưởi” ban đầu trên hình chữ nhật không có cột. Bên phải là ba mẫu sửa cục bộ quanh cột trụ, ứng với khoảng cách lẻ tới cạnh trái, khoảng cách chẵn tới cạnh trái, và trường hợp cột cách cạnh dưới đúng 3 đơn vị.](figures/2014-fil-fig-3.png)

Một điều thú vị là nếu tăng khoảng cách tối thiểu từ tâm cột đến biên hình chữ nhật từ \(3\) lên \(4\), lời giải còn đơn giản hơn. Khi đó không những trường hợp thứ ba biến mất, mà ta còn có thể cài đặt theo một cách khác: đặt tất cả các cột trước, rồi bắt đầu từ góc dưới bên phải và dựng chu trình một cách tham lam. Ở mỗi bước, luôn chọn nước đi khả dụng đầu tiên trong thứ tự:

```text
left, up, down, right
```

Có thể dễ dàng kiểm tra rằng trên hình chữ nhật ở Hình 3 sau khi bỏ cột dưới cùng, thuật toán sửa cục bộ và thuật toán tham lam tạo ra cùng một kết quả.

### Độ phức tạp

Cả cách chia thành các mảnh rồi ghép theo cây khung lẫn cách sửa cục bộ chu trình “lò sưởi” đều chỉ cần xử lý một lượng công việc hằng số cho mỗi ô và mỗi cột. Vì vậy, độ phức tạp thời gian là

\[
O(nm+f),
\]

và có thể lưu cấu trúc đường ống trong \(O(nm)\) bộ nhớ.
