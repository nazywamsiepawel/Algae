# algae

Algae is a fast matrix processing library written in Swift. Uses Accelerate and Metal.

##features

- [x] Convenience operators and constructors.
- [x] Constructors
- [x] Element-wise operations (e.g. trig functions, abs)
- [x] Basic Linear Algebra Subprograms (e.g. scalar multiplication, matrix multiplication, dot products)
- [ ] GPU support using Metal

### Vector

#### Constructing a Vector

```swift
  /* 5-dimension vector. By default filled with zeros */
  let v = Vector(size:5)
  /* 5-dimensional vector. Filled with given data */
  let v2 = Vector(data:[1.0, 2.0, 3.0, 4.0, 5.0])
```
#### Copying a Vector

```swift
  let m = m2.copy()
```

### Matrix

#### Constructing a matrix

```swift
  /* 2x2 Matrix. By default filled with zeros */
  let m = Matrix(rows:2, columns:2)
  /* 2x2 Matrix. Filled with given data */
  let m2 = Matrix(rows:2, columns:2, data:[1.0, 2.0, 3.0, 4.0])
```
#### Constructing an identity matrix

```swift
  /* 2x2 Matrix. By default filled with zeros */
  let m = Algae.eye(size:2, fill:1.0)
```

#### Copying a matrix

```swift
  let m = m2.copy()
```

### Basic operations
#### Element-wise sum and difference

#### Element-wise multiplication and division
#### Maximum and minimum
#### Mean, median, standard deviation and variance
#### Vector dot product
#### Matrix vector product
#### Matrix matrix product

### Element-wise mathematical operations
#### Negation
#### Element wise abs, sin, cos, tan, pow, sqrt, tanh etc.

### Custom operators
