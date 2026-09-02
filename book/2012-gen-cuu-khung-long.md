# Cứu khủng long ★★★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `gen`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/gen>


## Đề bài

Tin nóng từ Bytetown: các nhà khảo cổ vừa phát hiện hóa thạch khủng long gần thành phố! Sau khi nghe tin, một số người dân Bytetown muốn tới lấy một vài chiếc xương cho riêng mình. Để bảo vệ những di tích vô giá này, thị trưởng Bytetown quyết định bảo vệ khu khai quật và đã thuê quân đội cho mục đích đó.

Đại tướng Byteasar đã bố trí (n) binh lính tại một số vị trí chiến lược trong khu khai quật. (Binh lính không thể đứng tùy tiện vì sẽ cản trở công việc của các nhà khảo cổ; ngoài ra, họ phải có tầm nhìn tốt để bảo vệ khu vực.) Ta gọi một điểm trong khu vực là **được bảo vệ** nếu, khi di chuyển từ điểm đó theo bất kỳ hướng nào, ta không thể tránh việc làm giảm khoảng cách tới ít nhất một người lính.

Byteasar vừa được điều đến một tân binh. Đại tướng quyết định đặt người lính này tại một trong (m) vị trí chiến lược còn trống. Với mỗi vị trí có thể chọn, ông muốn biết tổng diện tích phần khu khai quật được bảo vệ.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên (n) và (m) ((3\le n\le100\,000), (1\le m\le100\,000)), lần lượt là số binh lính đã được bố trí và số vị trí chiến lược còn trống.

(n) dòng tiếp theo mô tả vị trí các binh lính. Dòng thứ (i) chứa hai số nguyên \(x_i,y_i\) (\(-10^8\le x_i,y_i\le10^8\)), là tọa độ của vị trí binh lính thứ (i) đang đứng trong hệ tọa độ Descartes.

(m) dòng tiếp theo mô tả, theo cùng định dạng, các vị trí chiến lược còn trống. Mọi điểm được nêu trong đầu vào đều phân biệt.

Có thể giả sử diện tích phần khu vực được bảo vệ bởi (n) binh lính ban đầu là dương.

### Dữ liệu ra

In đúng (m) dòng. Dòng thứ (i) phải là tổng diện tích phần khu vực được bảo vệ khi tân binh được đặt tại vị trí chiến lược còn trống thứ (i). Mỗi số phải được in với đúng một chữ số sau dấu thập phân.

### Ví dụ

Với dữ liệu vào:

```text
3 2
0 0
2 -1
1 2
3 1
1 0
```

kết quả đúng là:

```text
5.0
2.5
```

## Lời giải

### Vùng được bảo vệ là bao lồi

Trước hết, hãy xác định hình dạng của vùng được bảo vệ với một cách bố trí binh lính cố định. Xét ba người lính bất kỳ ở các điểm \(p_i\), \(p_j\), \(p_k\). Mọi điểm nằm trong tam giác \(p_ip_jp_k\) đều được bảo vệ: từ một điểm bên trong tam giác, di chuyển theo bất kỳ hướng nào cũng sẽ làm ta gần hơn với ít nhất một đỉnh của tam giác. Vì thế, mọi điểm trong **bao lồi** của các vị trí binh lính đều được bảo vệ.

Đây cũng là toàn bộ vùng được bảo vệ. Một điểm ở bên ngoài bao lồi có thể được ngăn cách khỏi bao lồi bởi một đường thẳng. Di chuyển từ điểm ấy theo hướng ra xa đường thẳng sẽ đồng thời tăng khoảng cách tới mọi điểm của bao lồi, nên cũng tăng khoảng cách tới mọi người lính. Các điểm trên biên bao lồi thực ra không được bảo vệ, nhưng biên có diện tích bằng (0), nên điều này không ảnh hưởng đến đáp án.

Vì vậy, bài toán tương đương với: với mỗi điểm trống \(p_j=(x_j,y_j)\), hãy tính diện tích bao lồi của các vị trí ban đầu cộng thêm \(p_j\). Ta sẽ luôn làm việc với **gấp đôi diện tích**, để mọi phép tính đều nguyên.

Một cách làm đơn giản là, với từng điểm trống, tính lại bao lồi rồi tính diện tích đa giác. Điều này tốn \(O(mn\log n)\). Nếu sắp xếp trước các điểm ban đầu, bao lồi của chúng có thể được dựng trong \(O(n)\), và cách làm này cải thiện thành \(O(n\log n+mn)\) — vẫn chưa đủ nhanh.

### Diện tích sau khi thêm một điểm

Hãy tính trước bao lồi \(W\) của \(n\) vị trí ban đầu trong \(O(n\log n)\). Gọi các đỉnh của nó, theo thứ tự ngược chiều kim đồng hồ, là

\[
a_0,a_1,\ldots,a_{k-1},
\]

với quy ước \(a_k=a_0\) và \(a_{-1}=a_{k-1}\). Với hai điểm \(a_i=(x_i,y_i)\) và \(a_j=(x_j,y_j)\), ký hiệu tích có hướng là

\[
a_i\times a_j=x_i y_j-y_i x_j.
\]

Gấp đôi diện tích của (W) là công thức dây giày

\[
\sum_{i=0}^{k-1} a_i\times a_{i+1}. \tag{1}
\]

Cố định một điểm trống \(p_j\). Nếu \(p_j\) nằm trong hoặc trên biên (W), bao lồi không đổi và ta trả về ngay diện tích của (W). Từ đây giả sử \(p_j\) ở bên ngoài (W).

Xét góc nhỏ nhất có đỉnh tại \(p_j\) chứa toàn bộ \(W\). Hai cạnh của góc này tiếp xúc với \(W\); nếu một cạnh chứa nhiều điểm của \(W\), chọn điểm gần \(p_j\) nhất. Hai điểm tiếp xúc là các đỉnh của \(W\); gọi chỉ số của chúng là \(\alpha(j)\) và \(\beta(j)\).

Bao lồi mới \(W_j\) gồm \(p_j\), \(a_{\alpha(j)}\), \(a_{\beta(j)}\) và phần biên của \(W\) nối \(a_{\alpha(j)}\) với \(a_{\beta(j)}\) **ở xa \(p_j\)**. Nói cách khác, biên của \(W_j\) gồm hai cạnh \(a_{\alpha(j)}p_j\), \(p_ja_{\beta(j)}\) và một đoạn liên tiếp các cạnh của \(W\).

Để cộng nhanh đoạn liên tiếp đó, đặt

\[
d[0]=0,\qquad
d[i+1]=d[i]+a_i\times a_{i+1}
\quad\text{với }i=0,\ldots,k-1.
\]

Khi đó, gấp đôi diện tích của \(W_j\) tính được trong thời gian hằng số:

\[
 a_{\alpha(j)}\times p_j+p_j\times a_{\beta(j)}+
\begin{cases}
d[k]-d[\beta(j)]+d[\alpha(j)],&\alpha(j)<\beta(j),\\
d[\alpha(j)]-d[\beta(j)],&\alpha(j)>\beta(j).
\end{cases} \tag{2}
\]

Vì thế, phần còn lại chỉ là tìm nhanh hai chỉ số tiếp xúc \(\alpha(j)\) và \(\beta(j)\) cho mọi điểm trống.

### Quét góc để tìm các điểm tiếp xúc

Kéo dài mỗi cạnh \(a_i a_{i+1}\) của (W) thành một tia bắt đầu tại \(a_i\). Cụ thể, với “tia có đỉnh \(a_i\)” ta hiểu tia cùng phương với \(a_{i-1}a_i\), nhưng bắt đầu từ \(a_i\) và đi tiếp ra ngoài đa giác. Các tia này chia phần ngoài của (W) thành các miền rời nhau, mỗi miền là một góc có đỉnh tại một \(a_i\).

Gọi \(A_i\) là miền gồm tia có đỉnh \(a_i\) và phần trong của góc được tạo bởi tia đó với tia \(a_i a_{i+1}\). Khi đó

\[
p_j\in A_{\alpha(j)}.
\]

Ta sẽ tìm tất cả các \(\alpha(j)\) đồng thời. Chọn một điểm \(s\) nằm trong \(W\), rồi quét góc tất cả các đỉnh của \(W\) và các điểm trống: quay ngược chiều kim đồng hồ một tia xuất phát từ \(s\), gọi là *tia quét*, và dừng tại những lúc tia đi qua một đỉnh của \(W\) hoặc một điểm trống. Ta duy trì cạnh \(a_\ell a_{\ell+1}\) của \(W\) đang bị tia quét cắt.

Nếu một đỉnh đa giác và một hay nhiều điểm trống thẳng hàng với (s), xử lý sự kiện ở đỉnh đa giác trước, rồi xử lý các điểm trống theo thứ tự bất kỳ. Khi gặp đỉnh \(a_i\), chỉ cần cập nhật (\ell=i).

Khi gặp điểm trống \(p_j\), cạnh đang được tia quét cắt là \(a_\ell a_{\ell+1}\); cạnh này cũng cắt phần trong của đoạn \(sp_j\). Các tia có đỉnh

\[
a_{\ell+1},a_{\ell+2},\ldots,a_{\alpha(j)}
\]

không cắt phần trong của đoạn \(sp_j\), trong khi các tia có đỉnh

\[
a_{\alpha(j)+1},\ldots,a_\ell
\]

lại cắt đoạn này. (Các dãy chỉ số được hiểu theo vòng tròn; chẳng hạn với \(x>y\), \(a_x,\ldots,a_y\) nghĩa là \(a_x,\ldots,a_{k-1},a_0,\ldots,a_y\).) Tính đơn điệu này cho phép tìm đúng chỗ chuyển, tức \(\alpha(j)\), bằng tìm kiếm nhị phân. Mỗi lần kiểm tra chỉ cần xét xem tia tại một đỉnh cố định có cắt phần trong của đoạn \(sp_j\) hay không, việc này thực hiện bằng các kiểm tra hướng/tích có hướng trong \(O(1)\).

Làm hoàn toàn đối xứng, quét theo hướng còn lại để tìm mọi \(\beta(j)\).

![Bên trái: đa giác \(W\) và hai điểm tới hạn của điểm trống \(p_j\). Bên phải: điểm \(p_j\) nằm trong miền \(A_i\).](figures/2012-gen-fig-1.png)

### Thuật toán và độ phức tạp

1. Dựng bao lồi (W) của các vị trí binh lính, sắp thứ tự các đỉnh ngược chiều kim đồng hồ, và tính mảng tổng tiền tố (d).
2. Với một điểm trống nằm trong hoặc trên biên (W), in diện tích ban đầu.
3. Với các điểm ngoài \(W\), dùng hai lần quét góc như trên để tìm \(\alpha(j)\) và \(\beta(j)\).
4. Thế các chỉ số vào công thức (2), rồi chia gấp đôi diện tích cho (2) để in đáp án.

Việc dựng bao lồi mất \(O(n\log n)\). Khi quét, ta sắp thứ tự góc của tổng cộng \(n+m\) điểm, sau đó với mỗi điểm trống thực hiện một tìm kiếm nhị phân trên các đỉnh của bao lồi. Do đó mỗi lần quét tốn

\[
O((n+m)\log(n+m)),
\]

và cả thuật toán có độ phức tạp thời gian

\[
\boxed{O((n+m)\log(n+m))}.
\]

Tất cả tọa độ đều nguyên, nên gấp đôi diện tích là số nguyên; diện tích thực chỉ có thể kết thúc bằng `.0` hoặc `.5`. Các tích có hướng và tổng diện tích cần được lưu bằng số nguyên có dấu 64 bit.
