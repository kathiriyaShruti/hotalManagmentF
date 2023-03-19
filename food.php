<?php
include('header.php');
include_once('dbcon.php');
include('connect.php');
// include ('bootstrap.php');
// session_start();

?>

<html>

<head lang="en">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
</head>


<style>
    .food-nav {
        display: flex;
        width: 100%;
        margin-top: 30px;
        position: sticky;
        top: 0px;
        background-color: #a9a0c1;
        border-radius: 50px;

    }

    .food-nav ul {
        display: flex;
        padding: 10px;
        align-items: center;
        justify-content: center;
        margin-left: 50px;
    }

    .food-nav ul li {
        list-style: none;
        padding: 10px;
        text-align: center;
        margin-left: 70px;
    }

    .food-nav ul li:hover {
        background-color: white;
        color: white;
        border-radius: 10px;
    }

    .food-nav ul li a {
        text-decoration: none;
        font-size: 20px;
        text-align: center;
        color: black;
        font-weight: 700;
    }

    .food-h {
        text-align: center;
    }
</style>
<!-- <nav class="food-nav">
    <ul>

        <li><a href="#south">South-Indian</a></li>
        <li><a href="#italian">Italian</a></li>
        <li><a href="#mah">Maharashtrian</a></li>
        <li><a href="#punjabi">Punjabi</a></li>
        <li><a href="#chinese">Chinese</a></li>
        <li><a href="#deserts">Deserts</a></li>
    </ul>
</nav> -->

<div class="container">
    <!-- ----------------------------------- South Indian-------------------------- -->
    <h1 class="food-h">Food</h1>
    <form action="manage_cart.php" method="POST">
        <section class="content">
            <div class="container-fluid">
                <div class="col-md-12">
                    <div class="row">
                        <?php
                        include('global.php');

                        function display()
                        {
                            $conn   = connection();
                            $str    = "select * from addfood";
                            $result = $conn->query($str);
                            $conn->close();
                            return $result;
                        }

                        $result = display();
                        if ($result->num_rows > 0)
                        {
                            while ($row = $result->fetch_assoc())
                            {
                                ?>



                                <div class="col-md-4">
                                    <div class="card card-primary card-outline">
                                        <div class="card-header">
                                            <div class="row mb-2">
                                                <div class="col-sm-6">
                                                    <h5 class="m-0"><?php echo ucfirst($row['name']); ?></h5>
                                                </div>
                                                <div class="col-sm-6">
                                                    <ol class="nav nav-pills nav-sidebar flex-column float-sm-right">
                                                        <li class="breadcrumb-item">
                                                            <button type="submit"
                                                                    class="btn btn-sm btn-tool" name="add_to_cart">
                                                                <i class="fas fa-add"></i> Add to Cart
                                                            </button>
                                                        </li>
                                                    </ol>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="card-body">
                                            <ul class="nav nav-pills nav-sidebar flex-column  users-list clearfix">
                                                <li class="row">
                                                    <div class="col-md-6">
                                                        <img src="<?php echo getBaseUrl() . '../uploads/' . $row['img'] ?>"
                                                             alt="delux">
                                                    </div>
                                                    <div class="col-md-6 text-right">
                                                        <strong>
                                                            <br><?php echo $row['foodtype']; ?>
                                                            <br> <?php echo $row['price']; ?> RS
                                                        </strong>
                                                    </div>

                                                </li>

                                            </ul>

                                        </div>

                                    </div>


                                </div>


                                <?php
                            }
                        }
                        ?>


                    </div>

                </div>
            </div>


        </section>

    </form>

</div>

</html>