# Hình chữ nhật cấp số cộng ★★★

**Tác giả đề:** Jakub Radoszewski  
**Tác giả lời giải:** Jakub Radoszewski  
**Bộ nhớ:** 128 MB  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/ary>


## Đề bài

Cho một bảng gồm \(n\times m\) ô vuông đơn vị. Mỗi ô chứa một số nguyên. Ta quan tâm đến các **hình chữ nhật cấp số cộng** trên bảng: đó là những hình chữ nhật ghép từ các ô vuông đơn vị sao cho các số trên mỗi hàng và mỗi cột đều tạo thành một cấp số cộng. Nhắc lại rằng trong một cấp số cộng, hiệu của hai số hạng liên tiếp luôn không đổi.

Hãy tìm hình chữ nhật cấp số cộng lớn nhất, tức là hình chứa nhiều ô vuông đơn vị nhất. Chẳng hạn, trong bảng dưới đây, hình chữ nhật cấp số cộng lớn nhất gồm chín ô:

```text
5  3  5  7
2  4  4  4
3  5  3  1
6  3  2  4
```

### Dữ liệu vào

Dòng đầu chứa một số nguyên \(t\) (\(1\le t\le 10\,000\)), là số bộ dữ liệu. Mỗi bộ bắt đầu bằng hai số nguyên \(n,m\) (\(1\le n,m\le 3\,000\)). Mỗi dòng trong \(n\) dòng tiếp theo chứa \(m\) số nguyên thuộc đoạn \([0,10^9]\), lần lượt là các số trong các ô của bảng. Kích thước mỗi tệp dữ liệu vào không vượt quá 20 MB.

### Dữ liệu ra

In ra \(t\) dòng, mỗi dòng là đáp án của một bộ dữ liệu. Đáp án là số ô vuông đơn vị nằm trong hình chữ nhật cấp số cộng lớn nhất của bảng tương ứng.

### Ví dụ

```text
Input                 Output
2                     9
4 4                   6
5 3 5 7
2 4 4 4
3 5 3 1
6 3 2 4
2 3
0 1 2
1 2 3
```

## Lời giải

Để trình bày lời giải, ta dùng hai bài toán phụ quen thuộc hơn. Mỗi bài toán sau sẽ được quy về bài toán đứng ngay trước nó.

### Tai nạn hàng không

Cho dãy \(n\) số nguyên \(a_1,\ldots,a_n\). Với mỗi phần tử, ta muốn tìm phần tử nhỏ hơn gần nhất nằm bên trái nó. Chính xác hơn, với mỗi \(i\in\{1,\ldots,n\}\), cần tìm chỉ số \(j\) lớn nhất thỏa \(j<i\) và \(a_j<a_i\). Để kết quả luôn tồn tại, thêm phần tử canh \(a_0=-\infty\).

![Hình 1. Các mũi tên tới phần tử nhỏ hơn gần nhất của dãy \(2,6,4,7,5,3\), với phần tử canh \(-\infty\).](figures/2011-ary-fig-1.png)

Tên gọi của bài toán bắt nguồn từ một cách phát biểu khá nghiệt ngã: biết số người thiệt mạng trong các tai nạn máy bay qua từng năm; với mỗi tai nạn, cần xác định đã bao lâu rồi mới lại có một tai nạn nghiêm trọng đến thế. Trong biến thể đó, ta tìm phần tử lớn hơn gần nhất bên trái. Sau đây ta quay lại phát biểu ban đầu.

Bài toán được giải trong thời gian tuyến tính bằng cách “đi theo các mũi tên”. Duyệt dãy từ trái sang phải và gắn cho mỗi phần tử một mũi tên trỏ đến phần tử nhỏ hơn gần nhất. Khi xử lý \(a_i\), trước hết kiểm tra \(a_{i-1}<a_i\). Nếu đúng, mũi tên từ \(a_i\) trỏ thẳng đến \(a_{i-1}\). Nếu không, đi theo mũi tên của \(a_{i-1}\) đến phần tử nhỏ hơn gần nhất của nó. Tiếp tục như vậy cho đến khi gặp một phần tử nhỏ hơn \(a_i\).

![Hình 2. Quá trình xác định mũi tên cho phần tử cuối \(a_6=3\); các mũi tên màu cam là những mũi tên được lần ngược.](figures/2011-ary-fig-2.png)

Để chứng minh thời gian chạy tuyến tính, chỉ cần chỉ ra rằng mỗi mũi tên được đi qua nhiều nhất một lần. Giả sử khi xác định mũi tên cho \(a_i\), ta đi qua mũi tên xuất phát từ \(a_j\), với \(j<i\). Khi đó \(a_j\ge a_i\); nếu không thì \(a_j\) đã là một ứng viên cho kết quả của \(a_i\). Gọi \(a_k\) là phần tử cuối cùng tìm được cho \(a_i\). Khi xử lý các phần tử \(a_{i+1},a_{i+2},\ldots\), ta sẽ không bao giờ gặp lại \(a_j\) trong quá trình đi theo mũi tên. Muốn đến \(a_j\), ở một thời điểm nào đó phải nhảy qua \(a_i\); nhưng mũi tên nhảy qua \(a_i\) phải đi vào một phần tử nhỏ hơn \(a_i\), và phần tử gần nhất như vậy là \(a_k\). Vì thế mũi tên ấy không thể đi đến \(a_j\), vốn nằm bên phải \(a_k\).

### Mảnh đất

Xét bảng nhị phân \(A\) gồm \(n\) hàng và \(m\) cột. Cần tìm một hình chữ nhật toàn số 1 có diện tích lớn nhất. Ta gọi đây là bài toán tìm **mảnh đất tối ưu**, theo tên một bài của Olympic Tin học Ba Lan lần thứ 9.

![Hình 3. Một bảng nhị phân và mảnh đất tối ưu gồm chín ô.](figures/2011-ary-fig-3.png)

Bài toán có lời giải \(O(nm)\). Ký hiệu \((i,j)\) là ô ở hàng thứ \(i\) từ trên xuống và cột thứ \(j\) từ trái sang. Với mỗi ô, tính

\[
D[i,j]=\text{số ô 1 liên tiếp đi xuống dưới, kể cả ô }(i,j).
\]

Duyệt từ dưới lên: nếu \(A[i,j]=1\) thì \(D[i,j]=D[i+1,j]+1\), ngược lại \(D[i,j]=0\). Tất cả các giá trị được tính trong \(O(nm)\).

![Hình 4. Mảng phụ \(D\) của bảng trong hình 3; khung đậm minh họa hình chữ nhật tối ưu.](figures/2011-ary-fig-4.png)

Quan sát chủ chốt là mảnh đất tối ưu có thể thu được như sau. Chọn một ô \((i,j)\), dựng hình chữ nhật có ô ấy trên cạnh trên, chiều cao \(D[i,j]\), rồi kéo dài sang trái và phải tối đa cho đến biên bảng hoặc đến một ô 0. Ta sẽ thử mọi cách chọn \((i,j)\).

Thật vậy, một hình chữ nhật tối ưu có thể được giả sử là cực đại: mỗi cạnh của nó hoặc trùng với biên bảng, hoặc kề một ô 0. Đặc biệt điều này đúng với cạnh dưới. Chọn một ô \(i_0,j\) ở hàng dưới cùng kề ô 0 (hoặc chọn tùy ý nếu cạnh dưới trùng biên bảng), và gọi \(i\) là hàng trên cùng. Hình chữ nhật có chiều cao \(D[i,j]\), chứa \((i,j)\) trên cạnh trên, và không kéo dài thêm được về trái hay phải. Nó đúng là một trong các hình mà cách dựng trên xét tới.

Có thể phát biểu quan sát ấy theo cách khác. Với mỗi ô \((i,j)\) có \(D[i,j]>0\), tìm hai chỉ số gần nhất \(j'<j<j''\) sao cho

\[
D[i,j']<D[i,j],\qquad D[i,j'']<D[i,j],
\]

trong đó \(j'\) lớn nhất và \(j''\) nhỏ nhất. Hai cột này nằm ngay ngoài hai cạnh dọc của mảnh đất. Quy ước \(D[i,0]=D[i,m+1]=0\), diện tích ứng với ô \((i,j)\) là

\[
(j''-j'-1)D[i,j].
\]

Hai chỉ số \(j'\) và \(j''\) được tìm bằng đúng thuật toán “tai nạn hàng không”: một lượt từ trái sang phải và một lượt từ phải sang trái trên mỗi hàng của \(D\). Tổng thời gian vẫn là \(O(nm)\).

### Hình chữ nhật cấp số cộng

Quay lại bảng \(n\times m\) các số nguyên không âm. Trước hết xử lý riêng các hình chữ nhật có một cạnh bằng 1 hoặc 2.

Với hình cao 1, mỗi hàng có thể được chia thành các cấp số cộng cực đại, mỗi dãy dài ít nhất hai và hai dãy liên tiếp có đúng một phần tử chung. Chẳng hạn, dãy \((6,3,0,4,8)\) được chia thành \((6,3,0)\) và \((0,4,8)\); dãy \((1,3,7,11,15)\) được chia thành \((1,3)\) và \((3,7,11,15)\). Nhờ đó có thể tìm hình cao 1 dài nhất trong \(O(nm)\). Làm tương tự cho hình rộng 1, cao 2 và rộng 2.

![Hình 5. Một hình chữ nhật cấp số cộng cực đại có diện tích 16.](figures/2011-ary-fig-5.png)

Từ đây chỉ xét các hình có cả hai cạnh dài ít nhất 3 và quy bài toán về “mảnh đất”. Đánh dấu một ô nếu hình vuông \(3\times3\) nhận ô đó làm tâm là một hình chữ nhật cấp số cộng.

![Hình 6. Các ô được khoanh là tâm của những hình vuông cấp số cộng \(3\times3\).](figures/2011-ary-fig-6.png)

Một hình chữ nhật có hai cạnh ít nhất 3 là hình chữ nhật cấp số cộng khi và chỉ khi mọi ô nằm trong nó, trừ vành biên trong rộng một ô, đều được đánh dấu.

- Chiều thuận là hiển nhiên: nếu hình chữ nhật là cấp số cộng thì mọi hình vuông \(3\times3\) nằm trong nó cũng vậy.
- Ở chiều ngược lại, khi hai ô được đánh dấu kề nhau, các cấp số cộng trong hai hình vuông \(3\times3\) tương ứng ghép lại thành những cấp số cộng dài hơn. Lặp luận điểm này cho thấy mọi dải cao 3 chạy hết chiều rộng và mọi dải rộng 3 chạy hết chiều cao đều là cấp số cộng. Vì vậy mỗi hàng và mỗi cột của toàn hình đều là một cấp số cộng.

Như vậy, sau khi xử lý riêng các hình “mỏng”, việc tìm hình chữ nhật cấp số cộng đủ dày có diện tích lớn nhất được quy về tìm hình chữ nhật toàn ô đánh dấu.

Còn một chi tiết nhỏ. Trong bài toán mảnh đất, ta chỉ cần hình có diện tích \(ab\) lớn nhất. Sau khi thêm lại vành biên rộng một ô, diện tích trở thành \((a+2)(b+2)\). Có thể xảy ra \(ab>cd\) nhưng \((a+2)(b+2)<(c+2)(d+2)\), nên mảnh đất có diện tích lớn nhất chưa chắc cho hình chữ nhật cấp số cộng lớn nhất.

Tuy nhiên, hình chữ nhật cấp số cộng tối ưu chắc chắn ứng với một **mảnh đất cực đại**, tức là không thể kéo dài theo bất kỳ hướng nào. Thuật toán của bài toán mảnh đất thực chất đã xét mọi mảnh đất cực đại khi tìm đáp án. Chỉ cần đánh giá diện tích sau khi thêm vành cho từng ứng viên, thay vì chỉ giữ ứng viên có diện tích lõi lớn nhất.

Do đó, toàn bộ bài toán được giải trong thời gian tối ưu \(O(nm)\).
