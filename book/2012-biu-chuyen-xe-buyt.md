# Chuyến xe buýt ★★★

**Tác giả đề:** Jakub Radoszewski  
**Tác giả lời giải:** Jakub Łącki  
**Bộ nhớ:** 128 MB  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/biu>


## Đề bài

Byteasar là giáo viên một trường tiểu học ở Byteburg. Thời tiết hiện rất đẹp, nên anh muốn đưa lớp của mình đi xe buýt tới Bytetown — thủ đô của Byteland. Byteasar quyết định thuê một công ty du lịch để tổ chức chuyến đi.

Các con đường ở Bytetown tạo thành một lưới đều gồm các đường theo hướng đông–tây và bắc–nam. Khoảng cách giữa hai con đường song song kề nhau luôn là 1 kilômét. Tại một số giao lộ có các điểm tham quan. Các hướng dẫn viên Bytean gán cho mỗi điểm một **hệ số hấp dẫn**: hệ số càng lớn thì điểm đó càng thú vị với du khách. Vì học sinh của Byteasar dễ chán, anh yêu cầu các điểm tham quan được ghé thăm phải có hệ số hấp dẫn tăng dần theo đúng thứ tự ghé thăm.

Công ty du lịch đồng ý đáp ứng yêu cầu ấy, nhưng cũng muốn kiếm được nhiều tiền nhất. Công ty nhận 1 bythaler cho mỗi kilômét của hành trình xe buýt. Khi đi giữa hai điểm tham quan liên tiếp trong lịch trình, xe buýt luôn chọn một đường đi ngắn nhất dọc theo các con phố của Bytetown. Ngoài ra, người quản lý của một số điểm tham quan còn trả tiền cho công ty khi đoàn ghé thăm điểm đó.

Hãy giúp công ty lập một hành trình thỏa yêu cầu của Byteasar và mang lại lợi nhuận lớn nhất. Lưu ý rằng đi ngang qua một điểm tham quan mà không dừng lại không được tính là đã ghé thăm điểm đó.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n,m\) (\(2\le n,m\le1000\)), lần lượt là số đường đông–tây và số đường bắc–nam.

\(n\) dòng tiếp theo mô tả các điểm tham quan ở Bytetown. Dòng thứ \(i\) gồm \(m\) số nguyên \(w_{i,j}\) (\(0\le w_{i,j}\le10^6\)), là hệ số hấp dẫn của điểm tham quan nằm tại giao lộ của đường đông–tây thứ \(i\) với đường bắc–nam thứ \(j\). Giá trị hấp dẫn bằng \(0\) nghĩa là giao lộ tương ứng không có điểm tham quan. Bảo đảm rằng Bytetown có ít nhất một điểm tham quan.

\(n\) dòng tiếp theo, mỗi dòng gồm \(m\) số nguyên \(c_{i,j}\) (\(0\le c_{i,j}\le10^9\)). Giá trị \(c_{i,j}\), tức số thứ \(j\) trên dòng thứ \(i\), là số tiền (tính bằng bythaler) công ty nhận được khi đưa đoàn tới điểm có hệ số hấp dẫn \(w_{i,j}\). Nếu giao lộ không có điểm tham quan thì giá trị tương ứng \(c_{i,j}\) bằng \(0\).

### Dữ liệu ra

In một số nguyên duy nhất: lợi nhuận lớn nhất, tính bằng bythaler, mà công ty có thể thu được từ một hành trình ghé một số điểm tham quan theo thứ tự hệ số hấp dẫn tăng **nghiêm ngặt**.

### Ví dụ

```text
Input                 Output
4 5                   39
1 2 6 0 2
1 3 4 0 4
0 0 4 0 3
2 2 0 0 4
1 3 5 0 2
2 8 1 0 2
0 0 3 0 4
0 5 0 0 3
```

Trong minh họa của ví dụ ở bản gốc, các số kiểu chữ thường là hệ số hấp dẫn, còn các số in nghiêng là khoản thu khi ghé điểm tương ứng. Hành trình tối ưu ghé năm điểm có các khoản thu lần lượt là \(2,2,8,3,5\), và tổng tiền nhận theo quãng đường xe chạy là \(19\). Vì vậy lợi nhuận bằng \(2+2+8+3+5+19=39\).

![Lộ trình tối ưu trong ví dụ; số thường là hệ số hấp dẫn, số nghiêng là khoản thu tại điểm tham quan.](figures/2012-biu-fig-example.png)

## Lời giải

### Đồ thị có hướng ẩn trong đề bài

Hãy xem mỗi giao lộ có điểm tham quan là một đỉnh. Có một cạnh có hướng từ \(u\) đến \(w\) khi hệ số hấp dẫn ở \(w\) lớn hơn nghiêm ngặt hệ số hấp dẫn ở \(u\). Từ đây, gọi hệ số hấp dẫn là **hạng** của đỉnh. Đồ thị này không có chu trình: sau mỗi cạnh, hạng tăng lên, nên không thể quay về đỉnh đã đi qua.

Đồ thị còn có hai loại trọng số:

- Trọng số của một đỉnh là khoản tiền công ty nhận được khi ghé điểm tham quan tại giao lộ đó.
- Trọng số của cạnh \(uw\) là khoảng cách Manhattan giữa hai giao lộ, tức số kilômét của một đường đi ngắn nhất trên lưới.

Ta cần tìm đường đi có tổng trọng số đỉnh và cạnh lớn nhất. Đây chính là lợi nhuận của hành trình tương ứng.

Về nguyên tắc, có thể dùng quy hoạch động trên đồ thị có hướng không chu trình: duyệt đỉnh theo thứ tự tô-pô, và với mỗi đỉnh \(w\), thử mọi cạnh đi vào \(w\) để tính giá trị tốt nhất của một đường kết thúc tại \(w\). Tuy nhiên, không thể xây đồ thị một cách tường minh. Nếu mọi đỉnh có hạng khác nhau thì giữa mỗi cặp đỉnh có đúng một cạnh có hướng. Với \(n=m=1000\), có đến \(nm=10^6\) đỉnh và xấp xỉ

\[
\frac{(nm)(nm-1)}2\approx5\cdot10^{11}
\]

cạnh.

Nén các giá trị hấp dẫn dương khác nhau thành các hạng liên tiếp \(1,2,\ldots,r\). Gọi \(k_i\) là số đỉnh có hạng \(i\). Một đường hợp lệ chứa nhiều nhất một đỉnh của mỗi hạng. Hơn nữa, một đường tối ưu có thể được chọn để chứa đúng một đỉnh ở mỗi hạng: nếu đang thiếu hạng \(i\), chèn một đỉnh bất kỳ có hạng đó vào giữa hai hạng kề nhau. Khoản thu tại đỉnh không âm, và do bất đẳng thức tam giác, tổng khoảng cách sau khi chèn không giảm. Vì vậy tổng trọng số không giảm.

Thuật toán gồm \(r\) pha. Ở pha \(i\), ta tính giá trị tốt nhất cho các đỉnh hạng \(i\), chỉ từ các đỉnh hạng \(i-1\). Pha đầu tiên rất đơn giản: giá trị của một đỉnh chỉ là trọng số của chính nó. Nếu pha \(i\) thực hiện trong thời gian \(O(k_{i-1}+k_i\), tổng thời gian sẽ là

\[
O(k_1)+O(k_1+k_2)+\cdots+O(k_{r-1}+k_r)
=O(k_1+k_2+\cdots+k_r)=O(nm).
\]

Phần còn lại là cách thực hiện một pha trong thời gian tuyến tính theo số đỉnh tham gia.

### Một pha: đi sang phải và lên trên

Xét trước một trong bốn hướng chéo, cụ thể là từ trái-dưới sang phải-trên. Gán mỗi giao lộ tọa độ \((x,y)\). Với một đỉnh \(v\), ký hiệu `best(v)` là trọng số lớn nhất của một đường kết thúc ở \(v\). Trong pha \(i\), các giá trị `best(u)` đã biết cho mọi đỉnh \(u\) hạng \(i-1\).

Ta sẽ tính một giá trị ứng viên cho từng đỉnh \(w\) hạng \(i\) với hai tính chất:

- nó **không nhỏ hơn** đường tốt nhất đến \(w\) mà đoạn cuối đi sang phải và lên trên;
- nó **không lớn hơn** `best(w)` thực sự.

Nếu đoạn cuối của một đường tối ưu đến \(w\) đi sang phải và lên trên, hai cận này trùng nhau; do đó ta sẽ thu được đúng `best(w)`. Lấy giá trị lớn nhất trong bốn hướng sẽ cho đáp án của pha.

Trước hết cần một nhận xét đơn giản.

**Bổ đề 1.** Khoảng cách giữa hai điểm \(x_u,y_u\) và \(x_w,y_w\) không nhỏ hơn

\[
x_w-x_u+y_w-y_u.
\]

**Chứng minh.** Khoảng cách chính xác là

\[
|x_w-x_u|+|y_w-y_u|.
\]

Với mọi số thực \(z\), ta có \(|z|\ge z\). Áp dụng bất đẳng thức này cho cả hai hiệu tọa độ là xong. \(\square\)

Xét \(w=(x_w,y_w)\) hạng \(i\) và \(u=(x_u,y_u)\) hạng \(i-1\). Nếu đi từ \(u\) tới \(w\) sang phải và lên trên, tức \(x_u\le x_w\) và \(y_u\le y_w\), thì đường qua \(u\) có trọng số

\[
\begin{aligned}
&\texttt{best}(u)+|x_w-x_u|+|y_w-y_u|+\texttt{weight}(w)\\
={}&\texttt{best}(u)+x_w-x_u+y_w-y_u+\texttt{weight}(w).
\end{aligned}
\]

Do đó, để chọn \(u\), chỉ cần cực đại hóa

\[
\texttt{useful}(u):=\texttt{best}(u)-x_u-y_u. \tag{1}
\]

Khi ấy giá trị của đường dựng đến \(w\) là

\[
\texttt{weight}(w)+x_w+y_w+\texttt{useful}(u). \tag{2}
\]

Sắp các đỉnh hạng \(i-1\) và \(i\) theo thứ tự không giảm của \(x+y\), rồi quét theo thứ tự đó. Ta luôn lưu đỉnh đã gặp có hạng \(i-1\) có `useful` lớn nhất. Khi gặp một đỉnh hạng \(i-1\), cập nhật đỉnh tốt nhất đang lưu theo (1). Khi gặp một đỉnh hạng \(i\), dùng đỉnh đang lưu để tạo ứng viên theo (2), rồi cập nhật `best` của nó nếu ứng viên tốt hơn.

Tại sao phép quét này đúng, dù đỉnh \(u\) tốt nhất đã lưu có thể không thực sự nằm trái-dưới \(w\)? Đặt \(u\) là đỉnh đã dùng để dựng ứng viên cho \(w\).

- Nếu \(u\) thực sự ở trái-dưới \(w\), (1) chọn chính xác tiền nhiệm tốt nhất trong hướng đang xét, nên ứng viên là tối ưu trong số các đường có đoạn cuối đi sang phải và lên trên.
- Nếu không, thì vẫn không có đỉnh \(u'\) nào ở trái-dưới \(w\) cho giá trị tốt hơn. Thật vậy, một đỉnh như thế luôn có \(x_{u'}+y_{u'}\le x_w+y_w\), nên đã xuất hiện trước \(w\) trong thứ tự quét; `useful(u)` là lớn nhất trong các đỉnh đã xuất hiện.
- Mặt khác, ứng viên không thể lớn hơn đáp án thật. Nó dùng \(x_w-x_u+y_w-y_u\) làm quãng đường; theo Bổ đề 1, giá trị này không vượt quá khoảng cách thật từ \(u\) tới \(w\). Vì thế trọng số của đường thật đi qua \(u\) không nhỏ hơn ứng viên.

Ba ý trên chính là hai tính chất đã yêu cầu: ứng viên không bỏ sót lời giải tối ưu theo hướng phải–lên, đồng thời cũng không thể là một cận trên sai cho giá trị tối ưu toàn cục.

### Ba hướng còn lại và sắp xếp hiệu quả

Làm hoàn toàn tương tự cho ba hướng chéo còn lại: phải–xuống, trái–xuống và trái–lên. Sau khi xét cả bốn hướng, lấy giá trị lớn nhất cho mỗi đỉnh hạng \(i\).

Nếu thực hiện riêng từng pha, ta có vẻ phải sắp xếp các đỉnh bốn lần. Thực ra chỉ cần hai kiểu thứ tự, vì thứ tự cho hướng trái–xuống là thứ tự đảo của hướng phải–lên; tương tự, hai hướng còn lại cũng là hai thứ tự ngược nhau. Hai khóa sắp xếp cần dùng là tổng và hiệu tọa độ.

Ta còn có thể tránh hoàn toàn thừa số logarit. Tổng tọa độ không vượt quá \(m+n\) (sau khi chọn gốc tọa độ phù hợp), nên có thể sắp xếp đếm trong thời gian \(O(k+W)\) cho \(k\) khóa thuộc đoạn \([1,W]\). Ban đầu, sắp xếp tất cả các đỉnh theo tổng tọa độ và riêng theo hiệu tọa độ; rồi nhóm chúng theo hạng. Như vậy, với mỗi hạng ta có hai danh sách đã được sắp theo hai khóa cần thiết. Trong pha \(i\), chỉ cần trộn tuyến tính hai danh sách của hạng \(i-1\) và \(i\), sau đó quét chúng như trên.

Do đó, lời giải chạy trong thời gian tối ưu \(O(nm)\), đúng bằng kích thước dữ liệu vào, và dùng bộ nhớ \(O(nm)\). Một cài đặt nên dùng số nguyên 64 bit cho các giá trị quy hoạch động và đáp án.
