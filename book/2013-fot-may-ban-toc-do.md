# Máy bắn tốc độ ★★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Tomasz Idziaszek  
**Bộ nhớ:** 256 MB  
**Mã bài:** fot  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2013/fot>


## Đề bài

Thị trưởng Bytetown dự định lắp đặt các máy bắn tốc độ trong thành phố. Bytetown có \(n\) giao lộ, được đánh số từ \(1\) đến \(n\), và \(n-1\) đoạn đường hai chiều. Mỗi đoạn đường nối hai giao lộ. Mạng lưới đường sá cho phép đi từ bất kỳ giao lộ nào đến bất kỳ giao lộ nào khác.

Máy bắn tốc độ chỉ được đặt tại giao lộ, nhiều nhất một máy tại mỗi giao lộ, và thị trưởng muốn đặt được nhiều máy nhất. Tuy nhiên, để các tài xế Bytean không quá bực bội, ông quy định rằng trên mỗi tuyến đường đi theo các con đường của Bytetown mà không đi qua một giao lộ nào quá một lần, chỉ được có nhiều nhất \(k\) máy bắn tốc độ, kể cả các máy ở hai đầu tuyến đường. Hãy xác định các giao lộ cần đặt máy.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n,k\) (\(1\le n,k\le1\,000\,000\)), lần lượt là số giao lộ của Bytetown và số máy bắn tốc độ tối đa có thể xuất hiện trên một tuyến đường.

\(n-1\) dòng tiếp theo mô tả mạng đường sá. Dòng thứ \(i\) chứa hai số nguyên \(a_i,b_i\) (\(1\le a_i,b_i\le n\)), nghĩa là có một đoạn đường hai chiều nối giao lộ \(a_i\) với giao lộ \(b_i\).

### Dữ liệu ra

Dòng đầu in số nguyên \(m\): số máy bắn tốc độ lớn nhất có thể đặt tại Bytetown. Dòng thứ hai in \(m\) số nguyên là các số hiệu giao lộ cần đặt máy. Nếu có nhiều đáp án, có thể in bất kỳ đáp án nào.

### Ví dụ

**Dữ liệu vào**

```text
5 2
1 3
2 3
3 4
4 5
```

**Một dữ liệu ra hợp lệ**

```text
3
1 2 4
```

## Lời giải

Đổi bài toán sang ngôn ngữ lý thuyết đồ thị: cho một cây \(n\) đỉnh, hãy đánh dấu nhiều đỉnh nhất sao cho trên mỗi đường đi đơn có nhiều nhất \(k\) đỉnh được đánh dấu.

Ta chỉ cần kiểm tra các đường đi **cực đại**, tức là không thể kéo dài thêm ở cả hai đầu. Thật vậy, mọi đường đi khác đều nằm trong một đường đi cực đại; nếu đường lớn hơn chứa không quá \(k\) đỉnh được đánh dấu thì đường con của nó cũng vậy. Trong một cây, mỗi đường đi cực đại bắt đầu và kết thúc ở lá.

Trên một đường đi đơn lẻ, chọn \(k\) đỉnh nào cũng như nhau. Nhưng khi hai đường đi dùng chung một số cạnh, đánh dấu các đỉnh chỉ thuộc một trong hai đường có lợi hơn đánh dấu các đỉnh chung. Nói không chính thức: nên ưu tiên các đỉnh gần lá, vì chúng thuộc ít đường đi hơn các đỉnh ở gần “trung tâm” cây; nhờ đó ta có thể đánh dấu nhiều đỉnh hơn.

### Các lớp của cây và thuật toán tham lam

Chia các đỉnh thành các **lớp** bằng quá trình bóc lá:

- Lớp \(1\) gồm tất cả các lá của cây.
- Lớp \(2\) gồm các đỉnh trở thành lá sau khi xóa mọi đỉnh lớp \(1\).
- Tổng quát, lớp \(i\) gồm những đỉnh trở thành lá sau khi xóa các lớp \(1,2,\ldots,i-1\).

![Hình 1. Phân lớp các đỉnh của cây bằng cách bóc dần các lá; các đỉnh màu cam là ví dụ về những đỉnh được đánh dấu.](figures/2013-fot-fig-1.png)

Nếu \(k\) chẵn, đánh dấu mọi đỉnh thuộc \(k/2\) lớp đầu tiên. Nếu cây có ít hơn \(k/2\) lớp thì hiển nhiên đánh dấu toàn bộ các đỉnh.

Nếu \(k\) lẻ, đánh dấu các đỉnh thuộc \(\lfloor k/2\rfloor\) lớp đầu tiên, rồi đánh dấu thêm **một** đỉnh bất kỳ còn lại, nếu còn đỉnh nào. (Nếu không còn đỉnh nào thì toàn bộ cây đã được đánh dấu.)

Xét một đường đi từ lá đến lá và ghi các số lớp của các đỉnh trên đường đi theo thứ tự. Mỗi đỉnh kề với nhiều nhất một đỉnh thuộc lớp cao hơn; hơn nữa, hai đỉnh cùng lớp không kề nhau. Vì vậy dãy số lớp ban đầu tăng nghiêm ngặt, rồi giảm nghiêm ngặt. Suy ra trên bất kỳ đường đi nào có nhiều nhất hai đỉnh của mỗi lớp.

Do đó:

- nếu \(k\) chẵn, \(k/2\) lớp đầu chứa trên mỗi đường đi nhiều nhất

\[
2\cdot\frac{k}{2}=k;
\]

- nếu \(k\) lẻ, \(\lfloor k/2\rfloor\) lớp đầu chứa nhiều nhất

\[
2\left\lfloor\frac{k}{2}\right\rfloor=k-1
\]

đỉnh được đánh dấu trên mỗi đường đi. Ta còn có thể đánh dấu thêm một đỉnh bất kỳ.

Vậy tập đỉnh mà thuật toán chọn luôn hợp lệ.

### Cài đặt trong thời gian tuyến tính

Tính bậc của từng đỉnh. Đưa mọi đỉnh hiện là lá vào hàng đợi \(Q_1\); khi cây chỉ gồm một đỉnh, coi đỉnh đó là lá để xử lý riêng trường hợp này.

Thực hiện \(\lfloor k/2\rfloor\) pha. Ở pha \(i\), đánh dấu và xóa toàn bộ các đỉnh trong hàng đợi \(Q_i\), tức lớp \(i\). Với mỗi cạnh nối một đỉnh vừa xóa tới đỉnh \(v\) chưa xóa, giảm bậc hiện thời của \(v\). Nếu bậc của \(v\) trở thành \(1\), đưa \(v\) vào \(Q_{i+1}\). Khi \(k\) lẻ, sau các pha đó, lấy một đỉnh chưa bị xóa bất kỳ và đánh dấu nó.

Mỗi đỉnh và mỗi cạnh được xử lý số lần hằng số, nên thời gian chạy là \(O(n)\), bộ nhớ cũng là \(O(n)\).

### Chứng minh tối ưu

Trước hết, giả sử \(k\) chẵn và đặt \(K\) là tập đỉnh thuộc \(k/2\) lớp đầu. Lấy một nghiệm tối ưu bất kỳ. Nếu nó bỏ sót một đỉnh \(v\in K\), chọn một đỉnh như vậy có số lớp nhỏ nhất, gọi số lớp là \(\ell\). Phải có một đỉnh được đánh dấu \(u\) ở lớp cao hơn \(\ell\); nếu không, nghiệm này có ít đỉnh hơn tập \(K\) do thuật toán tạo ra. Chọn \(u\) sao cho giữa \(v\) và \(u\) không có đỉnh nào được đánh dấu.

Ta chứng minh rằng thay việc đánh dấu \(u\) bằng đánh dấu \(v\) vẫn cho một nghiệm hợp lệ. Ký hiệu \(P_{ab}\) là đường đi giữa hai đỉnh \(a,b\). Xét một đường lá–lá \(P_{xx'}\). Nếu nó không qua \(v\), hoặc cũng qua \(u\), phép thay thế không làm tăng số đỉnh được đánh dấu trên đường đó. Còn lại, giả sử \(P_{xx'}\) qua \(v\) nhưng không qua \(u\).

Lấy một đường từ lá \(x\) đến lá \(y\) đi qua cả \(v\) và \(u\). Nếu không tồn tại, có một đường từ \(x'\) đến một lá đi qua cả hai; chỉ cần đổi vai trò \(x,x'\). Gọi \(w\) là đỉnh chung cuối cùng của \(P_{xx'}\) và \(P_{xy}\). Khi đó \(w\) nằm trên đường đi từ \(v\) tới \(u\).

![Hình 2. Minh họa phép đổi trong chứng minh với \(k=6\): các đỉnh màu cam được đánh dấu, và các đường đi liên quan gặp nhau tại \(w\).](figures/2013-fot-fig-2.png)

Hai đường \(P_{xx'}\) và \(P_{x'y}\) có chung đoạn \(P_{x'w}\), không bị ảnh hưởng bởi phép thay thế. Trước thay thế, đoạn \(P_{wy}\) có ít nhất \(\ell-1\) đỉnh được đánh dấu ở các lớp thấp hơn \(\ell\), cộng thêm \(u\), nên có ít nhất \(\ell\) đỉnh được đánh dấu. Sau thay thế, đoạn \(P_{wx}\) có đúng \(\ell\) đỉnh được đánh dấu: một đỉnh tại mỗi lớp \(1,\ldots,\ell-1\) về phía lá \(x\), cùng với \(v\). Không có đỉnh đánh dấu nào giữa \(v,u\) theo cách chọn \(u\).

Vì vậy số đỉnh đánh dấu trên \(P_{xx'}\) sau thay thế không vượt số đỉnh đánh dấu trên \(P_{x'y}\) trước thay thế. Đường thứ hai có không quá \(k\) đỉnh đánh dấu, nên đường thứ nhất cũng vậy. Ta có thể lặp phép thay thế để thu được một nghiệm tối ưu đánh dấu toàn bộ \(K\). Do thuật toán đánh dấu đúng \(K\), nó tối ưu khi \(k\) chẵn.

Khi \(k=2t+1\) lẻ, lập luận thay thế tương tự cho thấy có một nghiệm tối ưu chứa toàn bộ \(t\) lớp đầu. Sau khi bỏ các lớp đó, không thể chọn hai đỉnh còn lại: nếu chọn hai đỉnh như vậy, đường lá–lá đi qua chúng có hai nhánh ngoài, mỗi nhánh đi qua \(t\) lớp đã chọn, nên sẽ chứa ít nhất \(2t+2=k+1\) đỉnh đánh dấu. Vì thế một nghiệm hợp lệ có nhiều nhất \(\lvert K\rvert+1\) đỉnh. Thuật toán chọn đúng \(\lvert K\rvert+1\) đỉnh nếu còn đỉnh, hoặc chọn toàn bộ cây nếu không còn; do đó nó cũng tối ưu khi \(k\) lẻ.
