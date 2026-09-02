# Bản hit của mùa ★★★★

**Tác giả đề:** Tomasz Kociumaka, Jakub Radoszewski, Wojciech Rytter, Tomasz Waleń  
**Tác giả lời giải:** Tomasz Kociumaka  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `hit`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/hit>


## Đề bài

Nhà máy In Byteotia (BPF) vừa nhận một đơn hàng lớn sản xuất giấy dán tường kẻ sọc — xu hướng đang thịnh hành trong thiết kế nội thất mùa này. Mỗi tấm giấy dán tường gồm \(n\) sọc dọc có cùng chiều rộng, được tô bằng ba màu đỏ, lục và lam. BPF chịu trách nhiệm cả thiết kế lẫn in ấn. Khách hàng đã chỉ định màu cho một số sọc; với các sọc còn lại, họ để BPF hoàn toàn tự do lựa chọn.

BPF in một số sọc liên tiếp bằng một **khuôn in**. Mỗi vị trí trên khuôn có một màu xác định, và khuôn có thể ngắn hơn toàn bộ tấm giấy. Mỗi lần áp khuôn, các sọc của khuôn phải trùng khít với các sọc của giấy, rồi tất cả các vị trí trên khuôn được in cùng lúc. Vì thế, một sọc trên giấy có thể bị in nhiều lần. Nếu một sọc được in bằng nhiều màu khác nhau, màu cuối cùng của nó sẽ là hỗn hợp các màu ấy. Khuôn chỉ dùng được theo một chiều và không được xoay hay lật dưới bất kỳ hình thức nào.

Bất kể khiếu thẩm mỹ ra sao, ưu tiên hàng đầu của nhân viên BPF là thiết kế khuôn ngắn nhất có thể mà vẫn in được toàn bộ tấm giấy. Đối với những sọc đã được khách hàng chỉ định, họ phải dùng đúng màu thuần khiết, không pha thêm màu nào khác. Nói cách khác, mỗi lần khuôn phủ lên một sọc đã được chỉ định màu, vị trí tương ứng trên khuôn phải có chính xác màu đó. Không sọc nào trên giấy được phép để không màu.

### Dữ liệu vào

Dòng đầu chứa số nguyên \(t\)

\[
1\le t\le10,
\]

là số bộ test. Mỗi dòng trong \(t\) dòng tiếp theo mô tả một bộ test bằng một chuỗi gồm các chữ cái in hoa `R`, `G`, `B` và dấu sao `*`. Các chữ cái biểu thị màu của sọc tương ứng, còn dấu sao biểu thị sọc mà khách hàng chưa chỉ định màu.

Chuỗi không rỗng, có độ dài không quá \(3000\), và chứa nhiều nhất \(19\) dấu sao.

### Dữ liệu ra

Với mỗi bộ test, in một dòng chứa chuỗi chỉ gồm các chữ cái `R`, `G`, `B`: một khuôn có độ dài nhỏ nhất cho phép in tấm giấy theo yêu cầu. Nếu có nhiều đáp án đúng, được phép in bất kỳ đáp án nào.

### Ví dụ

**Dữ liệu vào**

```text
1
RRG*R*BRR**B
```

**Dữ liệu ra**

```text
RRGB
```

## Lời giải

Trước khi mô tả thuật toán, ta đưa ra một số khái niệm. Đối tượng cơ bản sẽ là **từ bộ phận** (*partial word*): ngoài các chữ cái thông thường — trong bài này là `R`, `G`, `B` — từ còn có thể chứa ký hiệu đại diện `*`, gọi là **ô trống** (*blank*).

Hai ký tự thuộc tập \(\{R,G,B,*\}\) được gọi là **khớp** nếu chúng bằng nhau hoặc ít nhất một trong hai là ô trống. Ký hiệu quan hệ này là \(\approx\). Ta mở rộng nó cho hai từ bộ phận có cùng độ dài bằng cách yêu cầu mọi cặp ký tự tương ứng đều khớp nhau.

Chẳng hạn,

\[
\texttt{R*B}\approx\texttt{RG*}
\qquad\text{và}\qquad
\texttt{R*B}\approx\texttt{*RB},
\]

nhưng

\[
\texttt{RG*}\not\approx\texttt{*RB},
\]

vì ở vị trí thứ hai có hai chữ cái khác nhau là `G` và `R`. Do đó, \(\approx\) không có tính bắc cầu. Tuy nhiên, hai từ bộ phận khớp nhau khi và chỉ khi tồn tại một từ đầy đủ — không chứa ô trống — khớp với cả hai. Ta gọi từ ấy là một **phép điền chung**. Ví dụ, `RGB` là một phép điền chung của `R*B` và `RG*`.

Nhờ quan hệ \(\approx\), ta dễ dàng phát biểu bài toán tìm mẫu trong văn bản cho từ bộ phận: tìm mọi đoạn của văn bản khớp với mẫu. Tuy nhiên, mục tiêu của bài này là dựng **khuôn phủ** ngắn nhất, tức một mẫu mà các lần xuất hiện của nó phủ kín toàn bộ văn bản — bản thiết kế giấy dán tường. Ta còn yêu cầu khuôn phủ phải là một từ đầy đủ; nếu không, khuôn một ký tự `*` sẽ luôn là lời giải tầm thường.

Phiên bản bài toán này trên từ thông thường từng xuất hiện tại Olympic Tin học Ba Lan trong bài *Szablon* (vòng 2, kỳ OI thứ 12). Cần lưu ý rằng nếu xét mọi từ đầy đủ khớp với văn bản rồi lấy khuôn phủ ngắn nhất của chúng, ta chưa chắc thu được khuôn phủ ngắn nhất của chính văn bản bộ phận. Ngay ví dụ trong đề đã cho thấy điều đó.

### Kiểm tra một khuôn phủ

Trong phần lời giải, các ký tự của từ được đánh số từ \(0\).

Trước hết, xét cách kiểm tra một mẫu \(S\) độ dài \(m\) có phải là khuôn phủ của từ bộ phận \(T\) độ dài \(n\) hay không. Muốn vậy, \(S\) phải phủ cả vị trí đầu lẫn vị trí cuối của \(T\), nên nó phải khớp với một tiền tố và một hậu tố của \(T\). Hơn nữa, hai lần xuất hiện liên tiếp của \(S\) phải chồng lên nhau hoặc nằm sát nhau; nếu không, các vị trí ở giữa sẽ không được phủ.

Để hình thức hóa các điều kiện ấy, đặt

\[
\operatorname{Occ}(S,T)
\]

là tập các vị trí bắt đầu của những lần xuất hiện của \(S\) trong \(T\). Với

\[
A=\{a_1,\ldots,a_k\},
\qquad a_1<\cdots<a_k,
\]

định nghĩa

\[
\operatorname{MaxGap}(A)
=\max\{a_{i+1}-a_i: i=1,\ldots,k-1\}.
\]

**Nhận xét 1.** Mẫu \(S\) là khuôn phủ của từ bộ phận \(T\) khi và chỉ khi đồng thời thỏa mãn:

1. \(0\in\operatorname{Occ}(S,T)\);
2. \(\operatorname{MaxGap}(\operatorname{Occ}(S,T)\cup\{|T|\})\le |S|\).

Vì vậy, chỉ cần tính tập \(\operatorname{Occ}(S,T)\), việc có thể làm dễ dàng trong thời gian \(O(nm)\), rồi kiểm tra tiêu chuẩn trên.

> Cũng tồn tại thuật toán \(O(n\log n)\) cho bước này, nhưng như ta sẽ thấy, bài toán hiện tại không cần đến nó. Đây là một bài tập thú vị; có thể bắt đầu bằng trường hợp bảng chữ cái nhị phân.

### Lời giải ngây thơ

Trong bài, ta không được cho sẵn một ứng viên \(S\), mà phải tìm khuôn phủ ngắn nhất trong tất cả các từ. Điều kiện 1 của Nhận xét 1 giới hạn các ứng viên ở những từ khớp với một tiền tố nào đó của \(T\).

Có \(O(3^k n\) ứng viên như vậy, trong đó \(k\) là số ô trống trong \(T\): mỗi ứng viên được xác định duy nhất bởi độ dài và cách chọn một trong ba chữ cái cho từng ô trống của \(T\). Dùng thuật toán kiểm tra ở trên cho từng ứng viên cho ta lời giải ngây thơ với thời gian

\[
O(3^k n^3).
\]

### Cài đặt hiệu quả hơn

Nhiều ứng viên trong tập trên rất giống nhau. Thay vì tìm từng mẫu hoàn toàn độc lập, ta có thể dùng chung một phần phép tính. Thực tế, ta sẽ tính được tất cả các khuôn phủ trong thời gian về cơ bản tỉ lệ với số ứng viên.

#### Bước đầu tiên

Cố định một phép điền của \(T\), tức một từ đầy đủ \(\overline T\) khớp với \(T\). Các ứng viên ứng với phép điền này chính là các tiền tố của \(\overline T\).

Ta xử lý các tiền tố theo thứ tự độ dài tăng dần và duy trì tập lần xuất hiện \(\operatorname{Occ}\). Ở mỗi bước, tập này thu hẹp từ

\[
\operatorname{Occ}_{m-1}
=\operatorname{Occ}(\overline T[0..m-1],T)
\]

thành

\[
\operatorname{Occ}_m
=\operatorname{Occ}(\overline T[0..m],T).
\]

Ở đây, \(\overline T[0..m]\) là đoạn gồm các ký tự tại vị trí \(0,\ldots,m\). Ta chỉ cần kiểm tra những lần xuất hiện trong \(\operatorname{Occ}_{m-1}\) có thể kéo dài thêm ký tự \(\overline T[m]\) hay không; việc này tốn thời gian tỉ lệ với kích thước của \(\operatorname{Occ}_{m-1}\). Kiểm tra \(\overline T[0..m]\) có phải khuôn phủ cũng cần duyệt \(\operatorname{Occ}_m\). Do đó, mỗi bước tốn \(O(n)\), và toàn bộ thuật toán tốn

\[
O(3^k n^2).
\]

#### Mảng `Pref`

Ta có thể tiếp tục chia sẻ phép tính giữa các phép điền khác nhau. Khi kéo dài mẫu \(\overline T[0..m-1]\) thành \(\overline T[0..m]\), nếu \(T[m]\ne *\), ký tự được thêm đơn giản là \(T[m]\). Một lần xuất hiện tại vị trí cố định

\[
i\in\operatorname{Occ}_{m-1}
\]

kéo dài được qua \(T[m]\) khi và chỉ khi

\[
T[i+m]\approx T[m].
\]

Điều kiện này không phụ thuộc vào phép điền \(\overline T\) đang xét, dù việc \(i\) có thuộc \(\operatorname{Occ}_{m-1}\) hay không thì có thể phụ thuộc vào phép điền.

Suy ra, nếu \(T[i+p]\not\approx T[p]\) thì chắc chắn \(i\notin\operatorname{Occ}_m\) với mọi \(m\ge p\). Vì thế, ta định nghĩa mảng

\[
\operatorname{Pref}[i]
=\min\bigl(\{n-i\}\cup
\{p:T[i+p]\not\approx T[p]\}\bigr).
\]

Giá trị này là độ dài tiền tố dài nhất của \(T\) xuất hiện tại vị trí \(i\) trong \(T\). Có thể tính `Pref` trong \(O(nk)\), nhưng thuật toán ngây thơ \(O(n^2\) đã đủ cho bài này. Ta còn cần mảng ngược \(\operatorname{Pref}^{-1}\), trong đó \(\operatorname{Pref}^{-1}[p]\) lưu mọi vị trí \(i\) thỏa \(\operatorname{Pref}[i]=p\).

Nếu \(T[m]\ne *\), ta có

\[
\operatorname{Occ}_m
=\operatorname{Occ}_{m-1}
\setminus\operatorname{Pref}^{-1}[m],
\]

nên có thể cập nhật `Occ` rất dễ dàng.

> **Ghi chú hiệu đính:** Bản tiếng Ba Lan in \(\operatorname{Pref}^{-1}[m-1]\). Với quy ước \(\operatorname{Occ}_m=\operatorname{Occ}(\overline T[0..m],T)\) ngay phía trên, vị trí bị loại khi lần không khớp đầu tiên nằm tại độ lệch \(m\), nên chỉ số đúng là \(m\).

Ta còn phải dùng Nhận xét 1 để kiểm tra \(\overline T[0..m]\) có phải khuôn phủ hay không. Điều kiện 1 đã tự động đúng, vì mẫu là tiền tố; chỉ cần kiểm tra điều kiện 2. Vì vậy, ta cần duy trì

\[
\operatorname{MaxGap}(\operatorname{Occ}\cup\{|T|\}).
\]

Mỗi phép cập nhật chỉ xóa một vị trí khỏi \(\operatorname{Occ}\cup\{|T|\}\). Ta không bao giờ xóa \(0\) hoặc \(|T|\), nên `MaxGap` chỉ có thể tăng. Khi xóa một vị trí, chỉ cần tìm phần tử đứng trước và đứng sau nó, rồi xét hiệu giữa hai phần tử ấy như một ứng viên mới cho `MaxGap`.

Để làm việc này hiệu quả, ta lưu \(\operatorname{Occ}\cup\{|T|\}\) bằng danh sách liên kết đôi, kèm một mảng mà tại vị trí \(i\) chứa con trỏ đến nút tương ứng của danh sách — hoặc `null` nếu \(i\) không thuộc tập.

Với một phép điền cố định, mỗi phần tử chỉ bị xóa khỏi `Occ` một lần, nên tổng chi phí thao tác trên `Occ` là \(O(n)\). Việc liệt kê các vị trí cần xóa bằng \(\operatorname{Pref}^{-1}\) cũng tốn tổng thời gian tuyến tính.

Riêng khi \(T[m]=*\), không thể dùng \(\operatorname{Pref}^{-1}\). Khi đó, ta kiểm tra trực tiếp những vị trí \(i\) thỏa

\[
\overline T[m]\approx T[i+m],
\]

tốn tổng cộng \(O(kn)\) cho một phép điền. Cộng trên mọi phép điền và kể cả thời gian dựng `Pref`, ta được độ phức tạp

\[
O(n^2+3^kkn).
\]

### Thuật toán phân nhánh

Một tối ưu nữa đến từ việc các tiền tố của hai phép điền khác nhau vẫn giống nhau cho tới ô trống đầu tiên được điền bằng hai chữ cái khác nhau. Trước khi \(m\) đi đến vị trí đó, ta có thể dùng chung toàn bộ phép tính.

Ta xây dựng một thuật toán kéo dài tiền tố \(\overline T[0..m-1]\) bằng \(T[m]\) nếu đó là chữ cái. Nếu \(T[m]=*\), thuật toán phân thành ba nhánh, mỗi nhánh gán một giá trị khác nhau cho \(\overline T[m]\). Mỗi lần phân nhánh phải sao chép trạng thái thuật toán — tức biểu diễn của \(\operatorname{Occ}\cup\{|T|\}\) — trong \(O(n)\). Ngoài chi tiết này, mỗi nhánh hoạt động như lời giải trước.

Giữa hai lần phân nhánh liên tiếp, ta chỉ phải cập nhật `Occ` theo cách trực tiếp đúng một lần, ngay sau khi phân nhánh. Vì vậy, không kể các lời gọi đệ quy, mỗi thể hiện của thuật toán tốn \(O(n)\).

Gọi \(C(n,j)\) là tổng thời gian của một thể hiện được gọi sau khi đã điền ô trống thứ \(j\). Khi đó,

\[
C(n,j)=
\begin{cases}
O(n), & j=k,\\
O(n)+3C(n,j+1), & j<k.
\end{cases}
\]

Hệ thức này cho

\[
C(n,0)=O(3^k n).
\]

Cộng thêm bước tiền xử lý, toàn bộ thuật toán chạy trong

\[
O(n^2+3^k n).
\]

### Lời giải chuẩn

Thành phần chi phối trong lời giải hiện tại là \(O(3^k n\), tương ứng với số ứng viên phải kiểm tra. Ta cần thu nhỏ tập ứng viên.

Giả sử biết khuôn phủ cần tìm có độ dài không quá \(m\). Khi đó chỉ có

\[
O(3^{k_m}m)
\]

ứng viên, trong đó \(k_m\) là số ô trống trong \(m\) ký tự đầu tiên của văn bản. Thuật toán phân nhánh khi ấy chạy trong

\[
O(n^2+3^{k_m}n).
\]

Bài toán đối xứng khi đảo ngược cả văn bản lẫn mẫu, nên ta cũng có thể định nghĩa \(k_m\) là số ô trống trong \(m\) ký tự cuối của văn bản.

Với

\[
m=\left\lfloor\frac n2\right\rfloor,
\]

ta có thể chọn một trong hai phía sao cho

\[
k_m\le\left\lfloor\frac k2\right\rfloor,
\]

vì ít nhất một nửa của văn bản chứa không quá một nửa tổng số ô trống. Nhờ đó, ta tìm được mọi khuôn phủ có độ dài không quá \(\lfloor n/2\rfloor\) trong thời gian

\[
O(n^2+3^{k/2}n),
\]

đủ nhanh với các giới hạn của đề.

Vẫn có thể xảy ra trường hợp \(T\) không có khuôn phủ nào dài không quá \(n/2\). May thay, việc kiểm tra một mẫu độ dài \(m\ge n/2\) có phải khuôn phủ hay không lại rất đơn giản. Tiền tố và hậu tố độ dài \(m\) đã phủ toàn bộ văn bản, nên chỉ cần mẫu khớp với cả hai. Nói cách khác, khuôn phủ độ dài \(m\ge n/2\) tồn tại khi và chỉ khi tiền tố và hậu tố độ dài \(m\) có một phép điền chung.

Theo nhận xét ở đầu lời giải, điều này tương đương với

\[
T[0..m-1]\approx T[n-m..n-1],
\]

hay

\[
\operatorname{Pref}[n-m]=m.
\]

Khi điều kiện đúng, ta dựng phép điền chung một cách trực tiếp. Do đó, dùng mảng `Pref`, ta có thể tìm khuôn phủ ngắn nhất với \(m\ge n/2\) trong thời gian tuyến tính.

Kết hợp với thuật toán cho các khuôn phủ ngắn hơn, lời giải chuẩn có độ phức tạp thời gian

\[
O(n^2+3^{k/2}n).
\]

Độ phức tạp bộ nhớ là

\[
O(kn),
\]

dù một cách cài đặt phân nhánh cẩn thận hơn có thể giảm xuống \(O(n)\).

## Lời kết

Thuật toán trên đủ nhanh cho bài, nhưng với \(k\) nhỏ thì vẫn còn xa tối ưu. Thực tế, tồn tại một thuật toán chạy trong

\[
O\!\left(nk^4+2^{O(\sqrt{k}\log k)}\right)
=O\!\left(nk^4+k^{O(\sqrt{k})}\right),
\]

ngay cả khi kích thước bảng chữ cái tăng tuyến tính theo \(n\).

Bạn đọc quan tâm có thể xem bài báo *Covering Problems for Partial Words and for Indeterminate Strings* của M. Crochemore, C. S. Iliopoulos và các tác giả của bài toán này: <https://arxiv.org/pdf/1412.3696.pdf>.
