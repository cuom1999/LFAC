# Chăn đi biển ★★★

**Tác giả đề:** Jakub Łącki  
**Tác giả lời giải:** Eryk Kopczyński  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `koc`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/koc>


## Đề bài

Mùa hè này, cư dân Byteburg kéo nhau đông đúc tới bãi biển thành phố bên hồ Byteania để tắm nắng. Mỗi người mang theo một chiếc chăn của hãng Byteasar và Son, mốt nhất mùa này. Mọi chiếc chăn đều có cùng kích thước \(a\times b\) (dù hoa văn khác nhau), và người tắm nắng luôn trải chăn sao cho cạnh dài hơn vuông góc với bờ hồ.

Giáo sư Byteoni, cũng là một người đi tắm nắng năm nay, nhận thấy rằng mỗi cư dân luôn trải chăn ở đúng vị trí yêu thích của riêng mình. Dù mọi người đến và rời bãi biển vào các thời điểm khác nhau, ông chưa từng nghe có ai chiếm vị trí yêu thích của người khác bằng chiếc chăn của mình. Điều đó khiến giáo sư tò mò và quyết định nghiên cứu hiện tượng này.

Ông lập một hệ tọa độ trên bãi biển và ghi lại, với mỗi trong \(n\) cư dân, tọa độ vị trí mà người đó luôn trải chăn. Hệ tọa độ được chọn sao cho trục \(OX\) song song với các cạnh độ dài \(a\), còn trục \(OY\) song song với các cạnh độ dài \(b\) của mọi chiếc chăn. Ban đầu giáo sư định tính diện tích giao của từng cặp chăn. Sau đó ông nhận ra chỉ cần giá trị trung bình của các diện tích ấy. Nói cách khác, ông cần kỳ vọng diện tích giao của hai chiếc chăn thuộc về hai cư dân Byteburg khác nhau, được chọn ngẫu nhiên. Hãy giúp ông tính giá trị đó.

### Dữ liệu vào

Dòng đầu chứa ba số nguyên \(n,a,b\):

\[
2\le n\le200\,000,\qquad 1\le a,b\le1\,000\,000,
\]

lần lượt là số cư dân và hai kích thước của chăn.

Mỗi trong \(n\) dòng tiếp theo chứa hai số nguyên \(x_i,y_i\):

\[
0\le x_i,y_i\le1\,000\,000,
\]

là tọa độ góc dưới bên trái của chiếc chăn mà cư dân thứ \(i\) luôn trải.

### Dữ liệu ra

In một số thực: diện tích giao trung bình của các cặp chăn thuộc về hai cư dân Byteburg khác nhau.

Kết quả được chấp nhận nếu thuộc đoạn

\[
[x-10^{-2},\ x+10^{-2}],
\]

trong đó \(x\) là đáp án chính xác.

### Ví dụ

**Dữ liệu vào**

```text
4 3 5
0 0
2 1
3 3
0 5
```

**Dữ liệu ra**

```text
1.833333333
```

Ở ví dụ này, sáu cặp chăn có diện tích giao lần lượt là \(4,0,0,1,6,0\). Vì thế đáp án chính xác là

\[
\frac{4+0+0+1+6+0}{6}=\frac{11}{6}.
\]

## Lời giải

### Đổi thứ tự cộng

Gọi \(S\) là tổng diện tích giao trên mọi cặp chăn không thứ tự. Nếu duyệt từng cặp \(i<j\) và cộng trực tiếp diện tích giao của chúng, đáp án cần in sẽ là

\[
\frac{S}{\binom n2}.
\]

Không thể duyệt \(\binom n2\) cặp khi \(n\) lớn. Thay vào đó, xét từng ô đơn vị của mặt phẳng. Nếu một ô đang bị phủ bởi đúng \(m\) chiếc chăn, nó thuộc phần giao của đúng

\[
\binom m2
\]

cặp chăn. Do đó, đóng góp của ô ấy vào \(S\) là \(\binom m2\). Chỉ cần tính tổng các đóng góp này trên toàn mặt phẳng.

### Quét theo trục \(x\)

Dùng đường quét thẳng đứng đi từ trái sang phải. Giữa hai hoành độ có sự kiện liên tiếp, tập chăn cắt đường quét không thay đổi. Gọi

\[
s=\sum_{\text{ô đơn vị trong cột hiện tại}}\binom{m}{2},
\]

tức tổng đóng góp trên một dải đơn vị theo chiều \(x\). Nếu đường quét nhảy một quãng \(d\) mà không đi qua cạnh đứng nào của chăn, ta tăng

\[
S\mathrel{+}=s\cdot d.
\]

Mỗi chiếc chăn \((x,y)\) tạo hai sự kiện: bắt đầu tại \(x\), kết thúc tại \(x+a\). Có thể xem nó hoạt động trên nửa khoảng \([x,x+a)\), nên tại mỗi hoành độ sự kiện ta cộng đóng góp từ đoạn trước, rồi xóa các chăn kết thúc và thêm các chăn bắt đầu. Cách quy ước ở đầu mút không ảnh hưởng diện tích.

Khi đường quét đang cắt một chiếc chăn có tung độ đáy \(y\), ta lưu \(y\) trong đa tập \(D\). Vấn đề còn lại: thêm hoặc xóa một giá trị \(y\) khỏi \(D\) thì cập nhật \(s\) thế nào?

### Đóng góp khi thêm một chiếc chăn

Giả sử ta thêm chăn mới có đáy \(y\). Với một chăn đang có đáy \(y'\), độ dài giao theo chiều dọc là

\[
m(y')=\max(0,\ b-|y-y'|).
\]

Đó chính là phần cần cộng vào \(s\) cho cặp gồm chăn mới và chăn có đáy \(y'\). Vì vậy đặt

\[
\Delta=\sum_{y'\in D}\max(0,b-|y-y'|).
\]

Sau khi tính \(\Delta\), tăng \(s\) thêm \(\Delta\), rồi chèn \(y\) vào \(D\). Khi một chiếc chăn kết thúc, làm ngược lại: trước tiên bỏ \(y\) khỏi \(D\), tính tổng \(\Delta\) với các phần tử còn lại, rồi giảm \(s\) đi \(\Delta\). Nhờ vậy không bao giờ tính một cặp hai lần.

Chỉ các \(y'\) thuộc đoạn \([y-b,y+b]\) mới có đóng góp. Tách đoạn này tại \(y\), ta được

\[
\begin{aligned}
\Delta
 &=\sum_{\substack{y'\in D\\y-b\le y'\le y}}(b-y+y')
   +\sum_{\substack{y'\in D\\y<y'\le y+b}}(b+y-y')\\
 &=\left(\sum_{[y-b,y]}y'\right)
   -\left(\sum_{(y,y+b]}y'\right)\\
 &\quad +(b-y)\,\#([y-b,y])+(b+y)\,\#((y,y+b]).
\end{aligned}\tag{1}
\]

Vì vậy, để tính \(\Delta\), chỉ cần trả lời trên một khoảng giá trị \(y\):

1. có bao nhiêu phần tử của \(D\) nằm trong khoảng đó;
2. tổng các phần tử đó bằng bao nhiêu.

### Cấu trúc dữ liệu

Dùng hai cây đoạn (hoặc hai Fenwick tree sau khi nén tọa độ):

- cây thứ nhất lưu số lần xuất hiện của mỗi tung độ;
- cây thứ hai lưu tổng các tung độ ấy.

Mỗi truy vấn tổng đoạn, truy vấn số lượng đoạn, chèn, và xóa đều mất \(O(\log M)\), với \(M\) là miền tọa độ được lưu. Do \(y_i\) và \(b\) bị chặn, có thể xây cây trực tiếp trên một miền \(O(10^6\); cách gọn hơn là nén các tọa độ \(y_i\) và dùng tìm kiếm nhị phân để xác định những tọa độ nằm trong các khoảng của (1).

Với mỗi sự kiện, dùng hai cây để tính \(\Delta\), cập nhật \(s\), và cập nhật đa tập \(D\). Sau khi quét xong, \(S\) đã là tổng diện tích giao của mọi cặp chăn. In

\[
\frac{S}{\binom n2}
\]

dưới dạng số thực.

### Độ phức tạp và độ chính xác

Có \(2n\) sự kiện. Sắp xếp chúng mất \(O(n\log n)\); mỗi sự kiện thực hiện hằng số thao tác cây, mất \(O(\log M)\). Tổng thời gian là

\[
O(n\log n+n\log M),
\]

hay \(O(n\log n)\) nếu nén tọa độ. Bộ nhớ là \(O(n)\) khi nén tọa độ (hoặc \(O(M)\) với cây trên miền tọa độ trực tiếp).

Giá trị \(S\) có thể vượt quá `long long`: tổng diện tích giao có thể vào cỡ \(n^2ab\). Không nên chỉ dùng `double` để tích lũy vì sai số có thể lớn. Có thể dùng `long double`, kiểu `__int128` của GCC, hoặc mô phỏng số nguyên 128-bit bằng hai số nguyên 64-bit. Các lựa chọn này đều đủ chính xác cho yêu cầu của bài.
