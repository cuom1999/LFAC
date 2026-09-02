# Giá cả ★★

**Tác giả đề:** Jakub Radoszewski  
**Tác giả lời giải:** Jakub Radoszewski  
**Giới hạn bộ nhớ:** 256 MB  
**Mã bài:** `cen`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2014/cen>


## Đề bài

Bajtazar làm nhân viên thu mua cho một nhà hàng ở Byteotia. Mỗi tối, anh nhận từ quản lý danh sách những thực phẩm phải mua vào sáng hôm sau. Bajtazar phải mua đúng một đơn vị của mỗi sản phẩm trong danh sách. Quản lý luôn yêu cầu tổng chi phí mua sắm phải nhỏ nhất có thể.

Buổi tối, Bajtazar ngồi trước máy tính và kiểm tra giá của tất cả sản phẩm cần mua tại các kho bán buôn thực phẩm trong vùng. Anh cũng biết chi phí đi từ nhà hàng đến từng kho rồi quay về. Bây giờ, Bajtazar phải quyết định sẽ mua những sản phẩm nào tại mỗi kho.

Với mỗi kho mà Bajtazar quyết định mua hàng, anh sẽ đi từ nhà hàng đến kho đó, mua sắm rồi lập tức chở hàng về nhà hàng. May thay, cốp xe đủ lớn nên anh không cần ghé một kho nhiều hơn một lần: toàn bộ hàng mua tại đó có thể được chở về trong một chuyến. Thực phẩm rất dễ hỏng, vì vậy trong một chuyến đi Bajtazar chỉ có thể mua hàng tại một kho.

Hãy viết chương trình giúp Bajtazar tính cách mua toàn bộ sản phẩm với chi phí nhỏ nhất.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n,m\)

\[
1\le n\le100,\qquad 1\le m\le16,
\]

lần lượt là số kho bán buôn và số sản phẩm Bajtazar phải mua. \(n\) dòng tiếp theo mô tả giá tại từng kho.

Số đầu tiên trên dòng thứ \(i\) là \(d_i\) (\(1\le d_i\le1\,000\,000\)), biểu thị chi phí đi từ nhà hàng đến kho thứ \(i\), kể cả lượt về. Tiếp theo là \(m\) số nguyên

\[
c_{i,1},c_{i,2},\ldots,c_{i,m}
\qquad (1\le c_{i,j}\le1\,000\,000),
\]

trong đó \(c_{i,j}\) là giá của sản phẩm thứ \(j\) tại kho thứ \(i\).

### Dữ liệu ra

In một dòng chứa một số nguyên: tổng giá các sản phẩm và chi phí đi lại đến những kho được chọn trong phương án mua sắm rẻ nhất.

### Ví dụ

**Dữ liệu vào**

```text
3 4
5 7 3 7 9
2 1 20 3 2
8 1 20 1 1
```

**Dữ liệu ra**

```text
16
```

**Giải thích.** Bajtazar mua sản phẩm số \(2\) tại kho thứ nhất và mua tất cả sản phẩm còn lại tại kho thứ hai. Vì thế, anh không cần ghé kho thứ ba.

## Lời giải

Ta cần lập kế hoạch mua \(m\) loại thực phẩm. Có \(n\) kho và kho nào cũng bán đủ mọi loại sản phẩm. Biết giá của từng sản phẩm tại từng kho cùng chi phí đi lại đến mỗi kho, ta muốn tìm một kế hoạch có tổng chi phí nhỏ nhất. Không nhất thiết phải ghé tất cả các kho.

Ta biết rằng có nhiều nhất \(16\) sản phẩm và không quá \(100\) kho.

### Lời giải thứ nhất

Đặt

\[
N=\{1,\ldots,n\},\qquad M=\{1,\ldots,m\}.
\]

Giới hạn \(m\le16\) gợi ý rằng thuật toán có thể có độ phức tạp hàm mũ theo \(m\). Một phương pháp chuẩn là quy hoạch động với các trạng thái tương ứng với những tập con của tập sản phẩm. Với mỗi \(A\subseteq M\), ta muốn tìm chi phí nhỏ nhất để mua các sản phẩm thuộc \(A\). Ký hiệu giá trị này là \(\operatorname{minCost}[A]\). Ta tính \(\operatorname{minCost}[A]\) cho các tập có kích thước tăng dần và lưu lại mọi giá trị đã tính.

Làm thế nào để tính \(\operatorname{minCost}[A]\)? Nếu \(A\ne\varnothing\), việc mua tất cả sản phẩm trong \(A\) đòi hỏi một số chuyến ghé kho. Hãy xét kho được ghé cuối cùng và những sản phẩm mua tại đó. Theo ký hiệu trong đề bài, \(c_{i,j}\) là giá sản phẩm \(j\) tại kho \(i\), còn \(d_i\) là chi phí đi lại đến kho \(i\). Đặt

\[
\operatorname{purchaseCost}[i,B]
  =d_i+\sum_{j\in B}c_{i,j} \tag{1}
\]

là tổng chi phí mua tất cả sản phẩm thuộc \(B\) tại kho \(i\), kể cả chi phí đi lại. Khi đó:

\[
\operatorname{minCost}[A]
=\min\bigl\{
  \operatorname{purchaseCost}[i,B]+\operatorname{minCost}[A\setminus B]
  : i\in N,\ B\subseteq A,\ B\ne\varnothing
\bigr\}. \tag{2}
\]

Trong công thức này, \(i\) là kho được ghé cuối cùng, còn \(B\) là tập sản phẩm mua tại kho đó. Công thức cũng xét cả những kế hoạch ghé một kho nhiều lần (kho \(i\) có thể đã xuất hiện khi tính kết quả cho \(A\setminus B\)), nhưng làm vậy chắc chắn không có lợi.

Như vậy ta đã có một lời giải đầu tiên, dù còn khá trừu tượng. Trước khi bàn đến chi tiết cài đặt, hãy ước lượng sơ bộ độ phức tạp. Trong công thức (2), có \(2^m\) khả năng cho \(A\); với mỗi tập như vậy, ta xét \(n\) kho cùng không quá \(2^{|A|}\le2^m\) tập con sản phẩm. Cận đơn giản là \(O(4^m n\), chưa đủ tốt. Tuy nhiên, từ chính công thức (2), ta có thể xây dựng một thuật toán nhanh hơn đáng kể.

### Biểu diễn tập con

Ta biểu diễn các tập con của \(M\) bằng những số nguyên từ \(0\) đến \(2^m-1\). Mỗi số trong khoảng này được viết bằng đúng \(m\) bit. Bit thứ \(i\) của mã tập \(A\) bật khi và chỉ khi \(i\in A\).

Với cách biểu diễn này, các phép toán bit trên mã số tương ứng với những phép toán tập hợp cơ bản. Chẳng hạn, giao của hai tập được tính bằng phép `and` trên hai mã. Nếu một tập là tập con của tập kia, hiệu của chúng tương ứng với phép trừ thông thường giữa hai mã. Cách biểu diễn này cũng cho phép đánh chỉ số hiệu quả cho các mảng trong lời giải, đặc biệt là mảng \(\operatorname{minCost}\).

Khi điền mảng \(\operatorname{minCost}\), lúc xét \(A\) ta phải có sẵn kết quả của mọi tập con của \(A\). Ta có thể xử lý các tập theo số phần tử tăng dần, nhưng với cách mã hóa trên còn có một cách đơn giản hơn: nếu \(B\subseteq A\), mã của \(B\) không lớn hơn mã của \(A\). Vì vậy chỉ cần duyệt các tập theo mã tăng dần, từ \(0\) đến \(2^m-1\).

Từ đây về sau, để đơn giản, ta đồng nhất một tập với mã của nó.

### Các tập con của một tập con

Trong phân tích trên, ta chặn thời gian tính một giá trị \(\operatorname{minCost}[A]\) bởi \(O(2^m n\), trong khi con số thực sự “chỉ” là \(O(2^{|A|}n\). Sự khác biệt này hóa ra rất quan trọng.

Thuật toán duyệt mọi tập con \(A\) của \(M\), rồi với mỗi \(A\), duyệt mọi tập con không rỗng \(B\) của nó. Có thể nhìn quá trình này như việc duyệt mọi cặp \((A,B)\) thỏa

\[
B\subseteq A\subseteq M.
\]

Ta đếm chính xác số cặp như vậy. Mỗi cặp có thể được mã hóa bằng cách tô mỗi phần tử của \(M=\{1,\ldots,m\}\) bằng một trong ba màu:

- màu thứ nhất cho các phần tử thuộc \(B\);
- màu thứ hai cho các phần tử thuộc \(A\setminus B\);
- màu thứ ba cho các phần tử thuộc \(M\setminus A\).

Vì

\[
B\cup(A\setminus B)\cup(M\setminus A)=M
\]

và ba tập này đôi một rời nhau, mỗi phần tử nhận đúng một trong ba màu. Mỗi cặp \((A,B)\) sinh ra một cách tô màu khác nhau và ngược lại. Có \(3^m\) cách tô màu các phần tử của \(M\), nên cũng có đúng \(3^m\) cặp cần xét. Nhờ đó, ta thu được một cận tốt hơn đáng kể cho độ phức tạp thời gian.

Tuy nhiên, để cài đặt thực sự đạt độ phức tạp phụ thuộc vào \(3^m\), thay vì \(4^m\), ta phải chỉ duyệt những cặp thỏa \(B\subseteq A\subseteq M\). Điều này rất đáng kể: \(4^{16}\) lớn hơn bốn tỉ, còn \(3^{16}\) chỉ xấp xỉ bốn mươi ba triệu.

Với một tập \(A\) cố định, ta duyệt các tập con theo mã giảm dần. Bắt đầu từ \(B=A\); ở mỗi bước, tập con kế tiếp được tính bằng

Trong mã giả dưới đây, `setMask` là mã của \(A\), còn `subsetMask` là mã của tập con đang xét.

```pseudocode
subsetMask := setMask
while subsetMask > 0 do
    process subsetMask
    subsetMask := (subsetMask - 1) and setMask
```

Chẳng hạn, với \(A=\{1,2,4,6\}\), các tập con do thuật toán sinh ra, viết dưới dạng nhị phân và đọc theo từng cột, là:

```text
101011    100011    001011    000011
101010    100010    001010    000010
101001    100001    001001    000001
101000    100000    001000    000000
```

Hãy giải thích vì sao thuật toán đúng. Rõ ràng, mọi tập sinh ra đều là tập con của \(A\). Vòng lặp không thể chạy vô hạn, vì sau mỗi bước, số \(B\) giảm ít nhất \(1\), còn phép `and` chỉ có thể làm nó nhỏ hơn nữa. Ta chỉ cần chứng minh rằng không có tập con nào của \(A\) bị bỏ sót.

Về trực giác, nếu \(A\) gồm một số phần tử liên tiếp bắt đầu từ phần tử \(1\), phép `and` hoàn toàn không cần thiết và thuật toán hiển nhiên sinh ra mọi tập con của \(A\). Nếu \(A\) có “khoảng trống”, tức tồn tại \(x\notin A\) trong khi một phần tử lớn hơn \(x\) lại thuộc \(A\), thì sau mỗi vòng lặp, các bit ứng với những khoảng trống ấy trong \(B\) sẽ bị xóa. Vì vậy chúng không ảnh hưởng đến điều xảy ra trên những bit ứng với phần tử của \(A\) khi trừ \(1\), nên có thể hoàn toàn bỏ qua chúng.

Ta có thể chứng minh hình thức bằng bổ đề sau.

**Bổ đề 1.** Giả sử \(B\subseteq A\), \(B\ne\varnothing\), và đặt

\[
B'= (B-1)\mathbin{\mathtt{and}} A.
\]

Khi đó \(B'\) là tập con của \(A\) có mã lớn nhất nhưng vẫn nhỏ hơn mã của \(B\).

**Chứng minh.** Viết \(A=\{a_1,\ldots,a_k\}\), với \(a_1<a_2<\cdots<a_k\). Trước hết, giả sử \(a_1\in B\). Khi đó tập con của \(A\) đứng ngay trước \(B\) là \(B\setminus\{a_1\}\). Nếu \(a_1\notin B\), gọi \(a_i\) (\(i>1\)) là phần tử nhỏ nhất của \(B\). Khi ấy tập đứng ngay trước \(B\) là

\[
\bigl(B\cup\{a_1,\ldots,a_{i-1}\}\bigr)\setminus\{a_i\}.
\]

Trong cả hai trường hợp, \(B'\) đúng là tập đứng ngay trước cần tìm. \(\square\)

Vậy việc dùng thuật toán hiệu quả để sinh mọi tập con của một tập cho ta lời giải có độ phức tạp thời gian

\[
O(3^m n).
\]

### Một cải tiến nhỏ và lời giải chuẩn

Ta có thể cải thiện thêm bằng cách loại bỏ thừa số \(n\) khỏi phần hàm mũ của thuật toán.

Trở lại công thức (2): ta đang xét mọi kho \(i\) và mọi tập sản phẩm \(B\) có thể mua tại đó. Nhưng với mỗi \(B\), chỉ cần xét một kho duy nhất — kho mà ta có thể mua tập sản phẩm ấy với giá rẻ nhất. Đặt

\[
\operatorname{minimumPurchaseCost}[B]
=\min\{\operatorname{purchaseCost}[i,B]:i\in N\}. \tag{3}
\]

Khi đó công thức (2) trở thành

\[
\operatorname{minCost}[A]
=\min\bigl\{
  \operatorname{minimumPurchaseCost}[B]+\operatorname{minCost}[A\setminus B]
  :B\subseteq A,\ B\ne\varnothing
\bigr\}. \tag{4}
\]

Tính tất cả giá trị \(\operatorname{minCost}[A]\) theo cách này chỉ mất \(O(3^m\) thời gian.

Ta tính trước mọi giá trị \(\operatorname{minimumPurchaseCost}[B]\) trực tiếp từ (3) và (1) trong thời gian \(O(2^m mn\). Cũng có thể giảm phần tiền xử lý này xuống \(O(2^m n\) bằng cách tính \(\operatorname{purchaseCost}[i,A]\) từ những giá trị đã biết, nhưng điều đó không làm thay đổi hiệu năng tổng thể cần thiết. Những lời giải kiểu này đã được chấp nhận trong kỳ thi.

Do đó, lời giải chuẩn chạy trong

\[
O(3^m+2^m mn)
\]

thời gian và dùng \(O(2^m\) bộ nhớ nếu xử lý lần lượt từng kho khi tính \(\operatorname{minimumPurchaseCost}\).

### Lời giải thay thế

Còn có một lời giải tốt hơn về cơ số hàm mũ: thừa số hàm mũ của nó chỉ là \(2^m\). Lời giải này cũng dùng quy hoạch động trên các tập con của tập sản phẩm. Lần này ta lưu nhiều trạng thái hơn, đổi lại có thể xét lần lượt từng kho và từng sản phẩm.

Đặt \(\operatorname{minCost}[i,A]\) là chi phí nhỏ nhất để mua các sản phẩm thuộc \(A\subseteq M\), với điều kiện chỉ được dùng các kho mang số \(1,\ldots,i\). Tiếp theo, đặt \(\operatorname{minCostWithWarehouse}[i,A]\) là chi phí nhỏ nhất với cùng điều kiện, nhưng bắt buộc phải mua hàng tại kho \(i\).

Các giá trị ban đầu là

\[
\operatorname{minCost}[0,\varnothing]=0,
\qquad
\operatorname{minCost}[0,A]=\infty\quad\text{với }A\ne\varnothing.
\]

Mục tiêu là tính \(\operatorname{minCost}[n,M]\). Với mỗi kho \(i=1,\ldots,n\), trước tiên ta tính các giá trị \(\operatorname{minCostWithWarehouse}[i,\cdot]\) từ \(\operatorname{minCost}[i-1,\cdot]\), rồi tính

\[
\operatorname{minCost}[i,A]
=\min\bigl(\operatorname{minCost}[i-1,A],\operatorname{minCostWithWarehouse}[i,A]\bigr).
\]

Công thức nói rằng nếu muốn mua tập \(A\) tại các kho \(1,\ldots,i\), hoặc ta không đến kho \(i\) và trả \(\operatorname{minCost}[i-1,A]\), hoặc ta có đến kho ấy và trả \(\operatorname{minCostWithWarehouse}[i,A]\).

Ta còn phải tính \(\operatorname{minCostWithWarehouse}[i,\cdot]\). Nhắc lại rằng đây là chi phí tối ưu của một kế hoạch có ghé kho \(i\), và có thể ghé cả những kho khác. Giả sử ta mua sản phẩm \(j\in A\) tại kho \(i\). Với sản phẩm này — nói chung là với mỗi sản phẩm mua tại kho \(i\) — ta có lựa chọn chuyển trạng thái

\[
\operatorname{minCostWithWarehouse}[i,A]
=\operatorname{minCostWithWarehouse}[i,A\setminus\{j\}]+c_{i,j}.
\]

Vì chưa biết sản phẩm nào được mua tại kho \(i\), ta chọn khả năng tốt nhất:

\[
\operatorname{minCostWithWarehouse}[i,A]
\mathrel{:=}\min\bigl\{
  \operatorname{minCostWithWarehouse}[i,A\setminus\{j\}]+c_{i,j}:j\in A
\bigr\}.
\]

Cần bổ sung trường hợp cơ sở: ta đi đến kho \(i\), trả phí đi lại, nhưng chưa mua sản phẩm nào ở đó. Khi ấy

\[
\operatorname{minCostWithWarehouse}[i,A]
=\operatorname{minCost}[i-1,A]+d_i.
\]

Gộp hai khả năng trên nghĩa là trước tiên gán giá trị cơ sở, rồi lần lượt giảm nó bằng các chuyển trạng thái theo từng sản phẩm. Sau đây là mã giả đầy đủ. Ta đồng nhất các tập con của \(M\) với mã từ \(0\) đến \(2^m-1\). Với sản phẩm \(j\in\{1,\ldots,m\}\), bit của nó có giá trị \(2^{j-1}\).

Trong mã giả, `travelCost[warehouse]` và `price[warehouse, product]` lần lượt tương ứng với \(d_i\) và \(c_{i,j}\).

```pseudocode
minCost[0, 0] := 0
for productMask := 1 to 2^m - 1 do
    minCost[0, productMask] := infinity

for warehouse := 1 to n do
    for productMask := 0 to 2^m - 1 do
        minCostWithWarehouse[warehouse, productMask] :=
            minCost[warehouse - 1, productMask] + travelCost[warehouse]
        for product := 1 to m do
            productBit := 2^(product - 1)
            if (productMask and productBit) != 0 then
                minCostWithWarehouse[warehouse, productMask] := min(
                    minCostWithWarehouse[warehouse, productMask],
                    minCostWithWarehouse[warehouse, productMask - productBit]
                        + price[warehouse, product]
                )

    for productMask := 0 to 2^m - 1 do
        minCost[warehouse, productMask] := min(
            minCost[warehouse - 1, productMask],
            minCostWithWarehouse[warehouse, productMask]
        )

return minCost[n, 2^m - 1]
```

Độ phức tạp thời gian của lời giải này hiển nhiên là

\[
O(2^m mn).
\]

Nếu lưu toàn bộ bảng, độ phức tạp bộ nhớ là \(O(2^m n\), nhưng rất dễ giảm về \(O(2^m\). Tại mỗi bước, ta chỉ dùng các giá trị \(\operatorname{minCost}[i,\cdot]\) của hai chỉ số \(i\) liên tiếp, và chỉ một lớp \(i\) của bảng \(\operatorname{minCostWithWarehouse}\). Vì thế, chỉ cần một bảng gồm hai hàng và có thể thay mọi truy cập \(\operatorname{minCost}[i,A]\) bằng \(\operatorname{minCost}[i\bmod2,A]\).

Ta còn có thể tiết kiệm thêm bộ nhớ bằng cách không tạo riêng mảng \(\operatorname{minCostWithWarehouse}\). Nếu thay mọi tham chiếu đến mảng này trong mã giả bằng tham chiếu đến mảng \(\operatorname{minCost}\), đồng thời cập nhật đúng theo thứ tự mã \(A\) tăng dần, thuật toán vẫn đúng. Việc kiểm chứng chi tiết được dành cho bạn đọc.
