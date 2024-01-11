echo "***************************************************************************************"
echo "Welcome to Dynamodb Data Batch Importer"
echo "It will import your Dynamodb data to aws using aws cli batch-write-item"
echo "Before we started, please check your aws configure"

echo "Please enter the region: "
read -e aws_region_name

echo "Please enter the exported table name"
read -e folder_path
echo "finding import script at " $folder_path/ScriptForDataImport

start_time="$(date -u +%s)"

#import all data in the folder
for filename in $folder_path/ScriptForDataImport/*.txt; do
    echo "importing ${filename}"
    aws dynamodb batch-write-item --region $aws_region_name --request-items file://${filename}
done


echo "Completed"
echo "***************************************************************************************"
end_func_time="$(date -u +%s)"
echo "Total of $(($end_func_time-$start_time)) seconds to completed the function"
