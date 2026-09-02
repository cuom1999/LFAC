# Cây và đàn kiến ★★★★

**Tác giả đề:** Szymon Acedański  
**Tác giả lời giải:** Szymon Acedański, Tomasz Idziaszek  
**Bộ nhớ:** 6 MB  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/drz>


## Đề bài

Những người làm tin học thích cây. Kiến cũng thích cây. Vì vậy, ta được cho một cái cây có hai con kiến bò trên đó — Kiến Trái và Kiến Phải — theo cách thể hiện trong hình minh họa của đề gốc (chúng bò theo đường chấm). Chúng bắt đầu hành trình ở đầu dưới của thân cây, mỗi con ở một phía đối diện.

![Hai con kiến đi theo hai phía của đường bao quanh cây; đường chấm biểu diễn hành trình của chúng.](figures/2011-drz-fig-1.png)

Khi đi xa dần khỏi gốc (đi lên), Kiến Trái mất 2 giây để đi hết một cạnh; khi đi về phía gốc (đi xuống), nó mất 1 giây. Kiến Phải nhanh gấp đôi Kiến Trái. Mỗi khi gặp nhau, cả hai con đều quay đầu và bắt đầu bò theo chiều ngược lại. Nếu một con bò từ cây xuống mặt đất, nó lập tức bắt đầu trèo lên phía bên kia của thân cây.

Ngoài ra, hai con kiến nhỏ đến mức ngay cả kính hiển vi cũng không nhìn thấy chúng (trong hình, chúng được cố ý vẽ lớn hơn rất nhiều). Hãy viết chương trình tính thời điểm hai con kiến quay đầu lần thứ hai.

### Dữ liệu vào

Dòng đầu chứa một số nguyên (t) ((1\le t\le 1000)), là số bộ dữ liệu.

Mỗi bộ dữ liệu gồm hai dòng. Dòng đầu chứa số nguyên chẵn (n) ((2\le n\le 100\,000\,000)), là số cạnh của cây. Dòng thứ hai chứa mô tả của cây: một xâu dài (n/2), biểu diễn một số nhị phân (2n) bit dưới dạng hệ thập lục phân, dùng các chữ số và các chữ cái thường từ `a` đến `f`.

Số này mô tả đường đi vòng quanh toàn bộ cây của Kiến Trái, giả sử Kiến Phải đứng yên. Đọc các bit từ trái sang phải, mỗi bit cho biết trên cạnh tiếp theo của hành trình, Kiến Trái đang đi xa khỏi gốc (bit 1) hay đi về phía gốc (bit 0). Cây có một thân, nghĩa là từ gốc chỉ có đúng một cạnh đi ra.

Kích thước tệp dữ liệu vào không vượt quá 50 MB. Lưu ý rằng con số này lớn hơn đáng kể lượng bộ nhớ dành cho chương trình.

### Dữ liệu ra

In ra (t) dòng, lần lượt là đáp án cho các bộ dữ liệu. Mỗi đáp án là thời điểm (tính bằng giây) hai con kiến quay đầu lần thứ hai, viết dưới dạng phân số tối giản (p/q) (không có khoảng trắng quanh dấu `/`), trong đó (p,q) là các số nguyên dương. Nếu đáp án là số nguyên thì, hiển nhiên, (q=1).

### Ví dụ

```text
Input                 Output
1                     282/5
28
fb1da30d1b7230
```

Bộ dữ liệu mẫu ứng với hình trong đề gốc và được chuyển thành dãy bit sau:

```text
1111 1011 0001 1101 1010 0011 0000 1101 0001 1011 0111 0010 0011 0000
```

## Lời giải

Giới hạn dữ liệu được chọn sao cho không thể lưu toàn bộ mô tả cây trong bộ nhớ. Lời giải chuẩn chỉ đọc mô tả đúng một lần và xử lý trực tuyến, không lưu lại. Phác thảo thuật toán như sau:

- Đọc kích thước cây; nhờ đó biết tổng số đoạn đi “lên” và đi “xuống”.

- Trong khi đọc mô tả, mô phỏng hành trình của Kiến Trái cho đến lần gặp thứ nhất. Trên mỗi cạnh, ta có thể kiểm tra cuộc gặp có xảy ra tại đó hay không: từ quãng đường Kiến Trái đã đi, ta suy ra được quãng đường Kiến Phải phải đi để tới điểm gặp.

- Sau cuộc gặp, cả hai con đi về phía gốc. Tiếp tục đọc dữ liệu, lần này mô phỏng hành trình của Kiến Phải. Điều có vẻ bất ngờ là Kiến Trái tới gốc trước, mặc dù Kiến Phải chạy nhanh hơn. Ta sẽ giải thích điều này ở dưới.

- Sau khi Kiến Trái tới gốc, tiếp tục mô phỏng Kiến Phải cho đến điểm gặp thứ hai.

Sau đây là mô tả chính thức hơn. Một điểm trên cây có thể được biểu diễn bởi cặp số thực ((a,k)), trong đó:

- (a) là tổng số cạnh Kiến Trái phải đi qua từ gốc để tới điểm ấy; nếu một cạnh được đi qua theo cả hai chiều thì nó được tính hai lần;
- (k) là độ cao của điểm, tức số cạnh trên đường từ gốc đến điểm ấy.

Nếu Kiến Trái mất (t_\uparrow) giây cho một cạnh đi lên và (t_\downarrow) giây cho một cạnh đi xuống, thời gian để nó tới ((a,k)) là

\[
[a,k,t_\uparrow,t_\downarrow]
:=\frac{a+k}{2}t_\uparrow+\frac{a-k}{2}t_\downarrow.
\]

Vì thế, điểm gặp thứ nhất \(a_1,k_1\) thỏa

\[
[a_1,k_1,2,1]
=[2n-a_1,k_1,1,\tfrac12]. \tag{1}
\]

Ta tìm điểm này bằng cách mô phỏng Kiến Trái trong lúc đọc từng cạnh. Giả sử Kiến Trái đang ở \((a,k)\), đầu mút của cạnh sắp xét. Đặt \(b=1\) nếu cạnh này đi lên và \(b=-1\) nếu nó đi xuống. Nếu cuộc gặp xảy ra sau khi đi một đoạn dài \(\varepsilon\) trên cạnh thì

\[
a_1=a+\varepsilon,\qquad k_1=k+b\varepsilon.
\]

Thế vào (1), ta được

\[
\varepsilon=\frac{6n-9a-k}{9+b}.
\]

Nếu \(0\le\varepsilon<1\), ta đã xác định được điểm gặp thứ nhất. Thời gian đi tới đó là

\[
t_1=[a_1,k_1,2,1]=\frac{3a_1+k_1}{2}.
\]

Giả sử sau cuộc gặp, ta để cả hai con tiếp tục quay về gốc. Kiến Trái sẽ tới gốc sau

\[
[a_1,-k_1,2,1]=t_1-k_1
\]

giây tính từ lúc xuất phát, còn Kiến Phải sẽ tới gốc sau

\[
[2n-a_1,-k_1,1,\tfrac12]=t_1-\frac{k_1}{2}.
\]

Do đó Kiến Trái luôn tới gốc trước Kiến Phải. Từ đây ta bắt đầu tìm điểm gặp thứ hai bằng cách mô phỏng hành trình của Kiến Phải.

Giả sử Kiến Phải đi một đoạn dài \(\varepsilon'\) trên cạnh bắt đầu tại \(a_0,k_0\), và tới điểm gặp thứ hai \(a_2,k_2\). Đặt \(b'=1\) nếu cạnh đang xét đi lên, \(b'=-1\) nếu nó đi xuống. Khi đó

\[
a_2=a_0+\varepsilon',\qquad k_2=k_0+b'\varepsilon',
\]

và điều kiện đồng bộ thời gian là

\[
[a_1,-k_1,2,1]+[2n-a_2,k_2,2,1]
=[a_2-a_1,k_2-k_1,1,\tfrac12].
\]

Suy ra

\[
\varepsilon'
=\frac{12n-9(a_0-a_1)+(k_0-k_1)}{9-b'}.
\]

Nếu \(0\le\varepsilon'<1\), ta đã tìm được điểm gặp thứ hai. Khoảng thời gian từ lần gặp thứ nhất đến điểm này là

\[
t_2=[a_2-a_1,k_2-k_1,1,\tfrac12]
=\frac{3(a_2-a_1)+(k_2-k_1)}{4}.
\]

Vì vậy, tổng thời gian từ lúc xuất phát đến lần gặp thứ hai là

\[
t_1+t_2=\frac{3(a_1+a_2)+k_1+k_2}{4}.
\]

Ta còn phải xử lý các phân số mà không dùng số thực. Giá trị \(\varepsilon\) là bội của \(1/(9+b)\); biến đổi đại số tương tự cho thấy \(\varepsilon'\) là bội của

\[
\frac{9-b}{(9+b)(9-b')}.
\]

Vì \(b,b'\in\{-1,1\}\), suy ra \(a_1,a_2,k_1,k_2\) đều là bội của \(1/800\). Do đó, mọi phép tính có thể được thực hiện chính xác bằng số nguyên 64 bit: chỉ cần lưu các đại lượng sau khi nhân với 800.

Mỗi bước của thuật toán đọc đúng một cạnh kế tiếp và thực hiện một số hằng phép toán. Vì vậy, độ phức tạp thời gian là \(O(n)\), còn bộ nhớ phụ là \(O(1)\).
